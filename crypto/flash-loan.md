# Flash Loans

## The :shrimp: with a :whale: punch

Market manipulation used to be crime reserved for only the wealthiest. Flash loans bring it within everyone's reach.

## Flash Loan First Blood 

Shots were fired on Feb 15th 2020 at exactly 01:38:57 UTC. [See attached receipt](https://etherscan.io/tx/0xb5c8bd9430b6cc87a0e2fe110ece6bf527fa4f170a4bc8cd032f768fc5219838).

A blockchain security firm released a detailed [step-by-step analysis](https://medium.com/@peckshield/bzx-hack-full-disclosure-with-detailed-profit-analysis-e6b1fa9b18fc) of the incident. TL;DR:

 1. **Flash Loan**: Ethereum account 0x148 took out a loan of 10k ETH (worth $2.6 million).
 2. **Collateralized Loan**: They locked up 5.5k ETH in a lending pool & used this as collateral to borrow 112 wBTC (worth $1 million)
 3. **The Pump**: They deposit 1.3k ETH as collateral to open a 5x leveraged long wBTC/short ETH position. Behind the scenes, 5.6k ETH was swapped for 51 wBTC via a market with too little liquidity and the price of wBTC shoots up to 3x it's normal price.
 4. **The Dump**: They sell all 112 borrows wBTC at the newly pumped price yielding 6.8k ETH.
 5. **Payback**: They buy back 112 wBTC at the newly deflated price for 4.3k ETH, repay their collateralized loan to unlock & withdraw their 5.5k Eth deposit, and then repay their 10k ETH flash loan with a healthy chunk of 1.2k ETH leftover as profit.

**Still TL;DR: somebody borrowed $2.6 million dollars and used it to manipulate a few small markets,  $355,880 in profit.**

If you're familiar w how financial markets operate, then this isn't exactly unheard of. Or even that unusual. Very wealthy people have been profiting off of market manipulation for as long as there have been markets. But a handful of things make *this* situation unique.

1. The amount of money required up-from to pull off this heist: $8.23. That's 8 dollars, the price of a sandwich. This was *not* a very wealthy person throwing their weight around & bullying small markets. This attacker might have been a very clever 14 year old kid who found a way to turn their weekly allowance into $355k dollars. No credentials, no reputation, no IDs, nothing other than $8 to pay the transaction fee was required. The critical feature that made this possible is the flash loan: more about this later.
2. It happened instantly. From the initial loan to the setup to the execution, this entire heist happened in just one moment. This means there was no time at all for the exploited parties to notice & take action. There was no time for any other traders to take advantage of the intermediate arbitrage opportunities. 
3. It was atomic and completely risk-free. The way this transaction manipulated several different markets is extremely complex and a miscalculation in one step could have made the whole thing infeasible. If something did go haywire and the attacker was left unable to repay that initial $2.6M loan, then the entire transaction would have failed and not one step of it would have executed. The flash loan enforced atomicity: either the entire heist succeeds or none of it does.

[Post-Mortem by bZk team](https://bzx.network/blog/postmortem-ethdenver).

## What even is a flash loan?

Nothing like a flash loan exists in traditional markets, it's an entirely new tool that's only possible on Ethereum & similarly powerful blockchains (ie not Bitcoin).

A flash loan is an *uncollateralized* loan that only exists during a single transaction. The loan is provided at the beginning of the transaction and must be repaid by the end of the transaction (usually including a small fee) otherwise the entire transaction will fail.

For example, if I take a $1 million flash loan and just send the money to one of my accounts with the intention to run away with it, the flash loan system will make a few checks at the end to see if it's repaid and flag the entire transaction as invalid if not. If the transaction is invalid, then none of the changes it attempted to make will actually happen meaning that the transfer of loan money to my account never happened (but the failed transaction still shows that it was *attempted*).

## What are the implications?

In any market place, the big fish :whale: have a lot of power.

Now, it's *illegal* to actually use that power so it rarely happens outright, but that doesn't stop some rich people from finding legal loop holes or trying to manipulate markets without getting caught. This is a big reason why KYC is so important in the traditional financial system: to identify & punish bullies.

But on Ethereum, the playing field is evened out a bit: *anybody* can be a big fish :whale: for one transaction. Anybody can get a multimillion dollar loan with zero collateral & no reputation.. As long as they repay it the same moment they receive it.

This is a *good* thing in most cases. For one example, imaging a very astute trader notices that some asset is trading for $100 on one exchange and $99.9 on another. There might be an opportunity to buy a bunch for $99.9 and sell them for $100 for a profit of $0.1 each.. But if they need to pay eg a $10 transaction fee then it's not profitable unless they can buy/sell more than 100 of them which would require an upfront investment of at least $9,990 just to break even. Traditionally, only very wealthy traders are able to capitalize on such a narrow margin.. But not with flash loans. Now *anybody* can take out a quick $99,900 loan, make some trades & turn it into $100,000, and repay the loan all at once to pocket the profit.

But with great power comes great responsibility.. there isn't any KYC or any way to punish bullies after the fact so won't this power be abused? Well, obviously. Account 0x148 committed a pretty clean-cut case of illegal market manipulation.. but nobody knows who they are (no KYC) so, most likely, they'll get away with it.

Does that mean Ethereum markets are too dangerous to interact with and destined to fail? Not so fast.

There were a couple problems exploited during this attack, most notably: a bug in the bZk market's code. A sanity check in the bZk code should have prevented the 5x leveraged position from being opened amidst such drastic price changes. This check was cleverly avoided by the attacker but new code will be deployed that won't be so easy to trick into entering unprofitable positions.

In general, market makers like bZk will treat illiquid markets (eg the ETH:wBTC market) with much more caution & be extremely careful if/when they're enabled for trading. Additionally, it's known to be bad practice to derive mission-critical prices directly from markets which are vulnerable to manipulation but this event provides a sharp example of what might happen to those who get sloppy.

Theoretically, bZk would survive this attack, upgrade their code, and come out the other side stronger than ever.

In practice, they've already been attacked again ([receipt for reference](https://etherscan.io/tx/0x762881b07feb63c436dee38edd4ff1f7a74c33091e534af56c9f7d49b5ecac15)) in a similar way but taking advantage of different markets, this one earned the attacker $600k profit.

If bZk does die from this one-two punch, the service that pops up to take their place will know not to repeat the mistakes of their predecessor.

Much like biological evolution, the Ethereum ecosystem is a ruthless survival of the fittest. Now that flash loans are being provided by one platform, they've become an apex predator reorganizing the balance of power.

Exploits that used to be available to only the 0.1% most wealthy can now be taken advantage of by everyone. There will likely be even more bloodshed in the weeks to come but, when the dust settles, the service providers left standing will be utterly resistant to market manipulation attacks.

And so, chaos makes the [anti-fragile](https://en.wikipedia.org/wiki/Antifragility) Ethereum ecosystem stronger.
