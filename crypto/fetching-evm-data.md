
# Notes re Fetching EVM Data

And a survey of the historical data provided by Etherscan, Alchemy, and Trueblocks.

## Intro

I'm working on a personal project called [value machine](https://github.com/bohendo/valuemachine). It provides a simple accounting service: it accepts a list of transactions and then executes them & tracks value as it flows between accounts. The goal is to kick-start an ecosystem of open source alternatives to TurboTax & other paid tax tools.

This project is philosophically aligned with [Rotki](https://rotki.com) but is focused on creating an npm package that anyone can use to create their own Rotki-like web app. The goal is not one perfect accounting application, but hundreds of accounting applications (of which, hopefully, one will be perfect for your use-case).

The battle plan is roughly:
1. finalize a schema for abstract transactions and then commission a very large number of input integrations that take evm chain data, coinbase csv exports, binance API access, etc and converts every last bit of a user's financial data into one standard transaction format.
2. value machine accepts these abstract transactions & executes them to produce the final (present) portfolio + rich, abstract historical data.
3. finalize the schema for abstract financial history and then commission a very large number of output integrations that produce portfolio overview charts, historical holding graphs, and tax returns for every jurisdiction in the world.

This project is built, first and foremost, to make life easy for those who are producing a large amount of financial activity on ethereum & other EVMs. But before we're ready to invest in tax return generators, even before we try to format evm data as abstract transactions, the very first step is to get all the data we need from an EVM.

The rest of this post will describe how challenging this first step is to accomplish efficiently, reproducible, and (ideally) without requiring any reliance on private data silos.

## The Goal

Converting evm data to abstract transactions is well underway but still under heavy development. Further, speedy development depends on having a local copy of clean & well formatted & *complete* evm data. At present, the following schemas are used to store a local copy of evm data.

```
type EvmTransaction = Type.Object({
  from: string;
  gasPrice: string;
  gasUsed: string;
  hash: string;
  logs: Array<{
    address: string;
    data: string;
    index: number;
    topics: string[];
  }>; // includes erc20 transfer info
  nonce: number; // required to calculate to address for contract creations
  status: number;
  timestamp: string;
  transfers: Array<{
    from: string;
    to: string | null;
    value: string;
  }>; // internal eth transfers
  to: string | null;
  value: string;
});

// This blob of json can be persisted on disk
export const EvmDataJson = Type.Object({
  addresses: {
    [address: string]: {
      history: string[]; // List of tx hashes that interact with this address
      lastUpdated: string;
    };
  };
  transactions: {
    [hash: string]: EvmTransaction;
  };
});
```

Once we have an account's `EvmDataJson` available locally, we can iterate on parsing all the degenerate yield farming data present in tx logs. But getting this data in the first place is non-trivial.

## The Naive Solution

Say I have a local node or an Infura account or any other Ethereum JSON RPC, are we good to go?! No.

There are 2 thorns in the side of this project (and any other evm-based accounting tool):
 1. Getting a list of transaction hashes that concern some address, for example bohendo.eth
 2. Getting a list of internal eth transfers for any given transaction

### Thorn 1: history

Given the bohendo.eth address, how do we find all of the transactions that interact with it? With just a simple JSON RPC, the only solution is to loop through every transaction of every block & check the `to` and `from` fields along with all log topics to try to determine whether any given contract is relevant to our target address. This is so prohibitively inefficient that I haven't even attempted it, I assume it would require time & compute resources on the order of what's required to sync a full node. But even if we succeeded in checking every single tx, we'll still miss internal transfers.

### Thorn 2: internal transfers

Unlike ERC20 transfers, when a smart contract sends eth to some other address it happens silently & the only sign that anything happened is that balances are different before & after the transaction. So, while combing through every single tx, if we have an archive node we can also check account balances before & after each tx to help detect internal eth transfers. But even this isn't enough bc we'd miss any cases where the target account received ETH and then, in the same tx, sent the same amount of ETH to another account.

## Practical Solutions

So if a simple JSON RPC isn't enough.. What is? The answer, of course, is an indexed database of blockchain data. Unfortunately, no available data silos fulfil our requirements cleanly. However Etherscan, at least, fulfils them to the bare-minimum required.

### Etherscan

Etherscan, although not exactly the [cypherpunk's](https://www.activism.net/cypherpunk/manifesto.html) ideal, does work. Imperfectly. Using etherscan to fetch all necessary evm data requires calling the following API endpoints:
- [get normal transactions for an address](https://docs.etherscan.io/api-endpoints/accounts#get-a-list-of-normal-transactions-by-address)
- [get internal transactions for an address](https://docs.etherscan.io/api-endpoints/accounts#get-a-list-of-normal-transactions-by-address)
- [get token transactions for an address](https://docs.etherscan.io/api-endpoints/accounts#get-a-list-of-normal-transactions-by-address)
- [get NFT transactions for an address](https://docs.etherscan.io/api-endpoints/accounts#get-a-list-of-normal-transactions-by-address)
- [get internal transfers for a transaction](https://docs.etherscan.io/api-endpoints/accounts#get-a-list-of-normal-transactions-by-address)
- [`eth_getTransactionByHash`](https://docs.etherscan.io/api-endpoints/geth-parity-proxy#eth_gettransactionbyhash)
- [`eth_getTransactionReceipt`](https://docs.etherscan.io/api-endpoints/geth-parity-proxy#eth_getTransactionReceipt)
- [`eth_getBlockByNumber`](https://docs.etherscan.io/api-endpoints/geth-parity-proxy#eth_getblockbynumber)

First, we can call the first 4 endpoints concurrently to get all normal, internal, token, and NFT transactions for our target address. We can then extract & dedup all returned transactions hashes to fill in the address history.

Next, we can loop through each returned tx hash and, for each, concurrently call get-internal-transactions-for-a-transaction, get-transaction-by-hash, and get-transaction-receipt to get *almost* all of the transaction details.

Unfortunately, Etherscan's API doesn't return a timestamp with it's transaction or receipt, only the block number. So we need to make one more call per tx hash to `eth_getBlockByNumber` to determine the transaction's timestamp based on the block number.

So that's 4 synchronous calls to get the tx history then another 2 round trips (3 requests total) per transaction (ouch) to get the required tx details.

### Covalent

Covalent seems like the new kid on the block, I recently discovered this project during the HackMoney 2021 hackathon and they give a good first impression.

Covalent features one extremely powerful API endpoint that's almost single handedly takes care of everything we need: [get transactions by address](https://www.covalenthq.com/docs/api/#get-/v1/{chain_id}/address/{address}/transactions_v2/).

In just one single query, we can give covalent our target address and in return receive a list of all relevant transactions. Just 2 problems: (1) internal eth transfers aren't tracked and (2) nonces aren't provided.

Covalent is clearly trying to go above & beyond the traditional JSON RPC schema, the transactions returned by Covalent are a combined data structure that contains both tx and receipt data as well as some deeper info such as token values that are pre-parsed according to that token address's decimals.

But, in inventing their own transaction schema, they've left out one critical piece of info: the account nonce. As a result, when value is transferred to a newly created contract, there is no way to determine which address the value was sent to because the `to` field is set to `null` during contract creation. Given the nonce, we can calculate this address on the fly but without it, we're missing critical info.

So, we're left with fetching all transactions from Covalent in one go and then looping through each transaction & making an Etherscan query or a traditional JSON RPC call to get the nonces. At which point, the benefits of using covalent mostly disappear.

But, if nonces are added to Covalent transactions & internal eth calls are added, Covalent becomes a Juggernaut that is *way* above & beyond any other solution. At least in terms of ease of use.

### Alchemy

Alchemy recently burst onto the scene with an enhanced JSON RPC API that features a new `alchemy_getAssetTransfers` method. This new method along with traditional JSON RPC method almost gives us everything we need.

We need to specify

### TrueBlocks

This is the true cypherpunk solution: an index of all address history that can be built locally given nothing but a (slightly enhanced) JSON RPC.

