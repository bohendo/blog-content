# Flash Loans

`bohendo.eth`

## The :shrimp: with a :whale: punch

Market manipulation used to be a crime reserved for only the wealthiest. Flash loans bring it within everyone's reach.

## Flash Loan First Blood

Shots were fired on Feb 15th 2020 at exactly 01:38:57 UTC. Raw event logs are in the [transaction receipt](https://etherscan.io/tx/0xb5c8bd9430b6cc87a0e2fe110ece6bf527fa4f170a4bc8cd032f768fc5219838).

A blockchain security firm released a detailed [step-by-step analysis](https://medium.com/@peckshield/bzx-hack-full-disclosure-with-detailed-profit-analysis-e6b1fa9b18fc) of the incident. TL;DR:

 1. **Flash Loan**: Ethereum account 0x148 took out a loan of 10k ETH (worth $2.6 million).
 2. **Collateralized Loan**: They locked up 5.5k ETH in [Compound](https://compound.finance) & used this as collateral to borrow 112 wBTC (worth $1 million)
 3. **The Pump**: They deposit 1.3k ETH collateral into the bZx lending pool to open a 5x leveraged long wBTC/short ETH position. Behind the scenes, 51 wBTC was purchased for 5.6k ETH via a market with too little liquidity and the price of wBTC shoots up to 3x it's normal price.
 4. **The Dump**: They sell all 112 borrows wBTC at the newly pumped price yielding 6.8k ETH and the price of wBTC on this market crashes again.
 5. **Payback**: They buy back 112 wBTC at the newly deflated price for 4.3k ETH, repay their collateralized loan to unlock & withdraw their 5.5k Eth deposit, and then repay their 10k ETH flash loan with a healthy chunk of 1.2k ETH leftover as profit.

**Still TL;DR: somebody borrowed $2.6 million dollars and used it to manipulate a few small markets, taking away $355,880 in profit.**

A pool of lenders was left with a position that had 51 wBTC & 1.3k ETH (worth $0.8M) of collateral and 5.6k ETH (worth $1.6M) of debt. This is the attacker's debt & probably won't ever be repaid. Especially because bZx has seized the attacker's collateral and are planning to auction it off to try to cover some of the debt.

If you're familiar w how financial markets operate, then this isn't exactly unheard of. Or even that unusual. Very wealthy people have been profiting off of market manipulation for as long as there have been markets and wealthy people. But a handful of things make *this* situation unique.

1. The amount of money required up-from to pull off this heist: $8.23. That's 8 dollars, the price of a sandwich. This was *not* a very wealthy person throwing their weight around & bullying small markets. This attacker might have been a very clever 14 year old kid who found a way to turn their weekly allowance into $355k dollars. No credentials, no reputation, no IDs, nothing other than $8 to pay the transaction fee was required.
2. It happened instantly. From the initial loan to the setup to the execution, this entire heist happened in just one moment. This means there was no time at all for the exploited parties to notice & take action. There was no time for any other traders to take advantage of arbitrage opportunities before our attacker could.
3. It was one atomic action, therefore completely risk-free. If something went haywire and the attacker was left unable to repay that initial $2.6M loan, then the entire transaction would have failed and not one step of it would have executed. The flash loan enforced atomicity: either the entire heist succeeds or none of it ever happened.

See the [Post-Mortem](https://bzx.network/blog/postmortem-ethdenver) by the bZx team for more info. Their stance is that "No users lost money" which is only *kind of* true, nobody formally lost money but the system is now under-collateralized & vulnerable to a bank-run situation.

## What even is a flash loan?

Nothing like a flash loan exists in traditional markets, it's an entirely new tool that's only possible on Ethereum & similarly powerful blockchains (ie not Bitcoin).

A flash loan is an *uncollateralized* loan that only exists during a single transaction. The loan is provided at the beginning of the transaction and must be re-paid in full (+ a fee) before finishing otherwise the entire transaction will fail.

From the loaner's perspective: if Alice has $1M laying around, she can flashloan it to Bob for $1 according to this agreement: Bob gets to take one action with this lump of $100 but, by the end of the action, $101 must be returned to Alice otherwise the action gets cancelled. As long as the smart contract agreement was audited, it's a pretty safe deal for Alice. The money can't go anywhere, it just grows by $1 in an instant. The risk to lenders is amazingly low.

This is not purely a financial weapon, it's a useful tool in a lot of cases.

For example, say an astute trader notices that some asset is trading for $100 on one exchange and $99.9 on another. There might be an opportunity to buy a bunch for $99.9 and sell them at the other place for $100 to yield a profit of $0.1 each.. But if they need to pay eg a $10 transaction fee then it's not profitable unless they can buy/sell more than 100 of them which would require an upfront investment of about $10k just to break even. Traditionally, only very wealthy traders are able to capitalize on such a narrow margin.. But not with flash loans. Now *anybody* can take out a huge loan, buy low/sell high, and profit.

In doing so, they equalize the price until it's $99.95 at both places and people like me who don't want to have to think about it can blindly use whichever exchange and safely assume that the price is the same everywhere. Thanks traders!

## What are the implications?

In any market, the big fish :whale: have the power to push smaller ones :shrimp: around.

For example, if someone went out and bought enough bananas (like 50% of all bananas), then the rest of the world would notice get scared of a banana shortage & pay more to get the few bananas that are left (the pump). Then, when people are panicking, you sell all the bananas you bought earlier at this new higher price & flood the market (the dump). Many do this & walk away with profit, having effectively stolen money from those who bought during the pump or sold during the dump.

Now, it's *illegal* to actually steal money from a market like this so it rarely happens outright, but that doesn't stop some wealthy people from finding legal loop holes or trying to manipulate markets without getting caught. The incentives are there. This is a big reason why KYC is so important in the traditional financial system's security model: the security model is to find out who someone is in real-life so if they bully people financially, they can be bullied back by the authorities in real life.

But on Ethereum, you can't identify people & bully them physically so market manipulation proceeds unchecked (one of the reason crypto markets are so volatile). Account 0x148 committed a pretty clean-cut case of illegal market manipulation.. But nobody knows who they are so they'll probably get away with it.

Does that mean Ethereum markets are too dangerous to interact with and destined to fail? Not so fast.

There were a couple problems exploited during this attack, most notably: a bug in the bZx market's code. A sanity check in the bZx code should have prevented the 5x leveraged position from being opened amidst drastic price changes that caused the debt to grow way past the value of the collateral. This check was cleverly avoided by the attacker but new code will be deployed that won't be so easy to trick into entering unprofitable positions.

In general, market makers like bZx will treat illiquid markets (eg the ETH:wBTC market) with much more caution & be extremely careful if/when they're enabled for trading. Additionally, it's known to be bad practice to derive mission-critical prices directly from markets which are vulnerable to manipulation but this event provides a sharp example of what might happen to those who get sloppy. Uniswap (one of the markets that played a key role in this attack) is preparing to launch an upgrade with improved price reporting that is resistant to manipulation by flash loan attacks.

Theoretically, bZx would survive this attack, upgrade their code, and come out the other side stronger than ever.

In practice, they've already been attacked again ([transaction receipt](https://etherscan.io/tx/0x762881b07feb63c436dee38edd4ff1f7a74c33091e534af56c9f7d49b5ecac15)) in a similar way but taking advantage of different markets, this one earned the attacker $600k profit.

If bZx does die from this one-two punch, the service that pops up to take their place will know not to repeat the mistakes of their predecessor.

Much like biological evolution, the Ethereum ecosystem is a ruthless survival of the fittest. Now that flash loans are being provided by one platform, they've become an apex predator reorganizing the balance of power.

Exploits that used to be available to only the 0.1% most wealthy can now be taken advantage of by everyone. There will likely be even more bloodshed in the weeks to come but, when the dust settles, the service providers left standing will be utterly resistant to market manipulation attacks.

And so, chaos makes the [anti-fragile](https://en.wikipedia.org/wiki/Antifragility) Ethereum ecosystem stronger.
