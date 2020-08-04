[Link to the announcement](https://www.reddit.com/r/ethereum/comments/hbjx25/the_great_reddit_scaling_bakeoff/)

Reddit wants to launch a system of Community Points & use blockchain-style tech to relinquish control over it. But Reddit is a huge site w millions of interactions/day & public blockchain systems can't handle that much activity. So Reddit asked for backup from the Ethereum community

I work for a startup called Connext & we're building one type of scalability solution called state channels. Money can be locked on a blockchain & require an IOU to unlock, just like gold used to be locked in the bank and could be withdrawn in exchange for an IOU (dollar dollar bill y'all). We're building a system for creating/managing/redeeming these blockchain-based IOUs.

These IOUs make some important trade-offs (our IOUs only require consensus between the two people involved) so our tech doesn't work as a solution to Reddit's challenge (which require consensus across the entire Community Points network). The solution to Reddit's challenge will be some sort of side-chain: it'll look like a cheaper, faster, mini-blockchain.

There were a lot off different side-chain submissions. A couple of them look very promising.

But how to trade between the Reddit side-chain and the public chain? Bob could give Alice a Community Point on the side-chain with the hope of receiving cryptodollars on the public chain, but Alice could also just walk off w the Community Point if she wanted to. It's inherently a two step process which makes it really hard to do securely.

Enter state channels!

Instead, let's say Bob gives Alice an IOU for a Community Point & Alice gives him an IOU for cryptodollars. IOUs can interact & be locked together such that they can either both be redeemed or neither can. This turns a two step process into a one step process which can be executed securely even if Bob & Alice don't trust each other.

So, no matter which side-chain Reddit chooses to build their Community Points, they're probably going to want to also use Connext state channels to fluidly move value between their chain and the rest of the blockchain universe.

[Connext's submission to the bake off](https://www.reddit.com/r/ethereum/comments/i1eooc/spacefold_connexts_submission_to_the_great_reddit/)

[Test it out our demo](https://www.spacefold.io/)
