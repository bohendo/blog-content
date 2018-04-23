
# Top 6 reasons why EIP999 is a horrible idea (but only the last 3 matter)

My goal here is to separate the strawmen from the real men and to shine line on this very dramatic debate. I am, however, a fallible human and it's possible that, in my effort to separate fallacies from facts, I introduced further fallacies. I encourage you to browse Wikipedia's [list of logical fallacies](https://en.wikipedia.org/wiki/List_of_fallacies) and point out any that might be distorting the way I'm viewing this debate.. But I know you don't need any encouragement to point out where & why I'm wrong ;)

## 1. Ignorance

I hate to say it, but the most common reason to oppose EIP999 comes from a misunderstanding of what's actually going on. I am **not** saying that anyone who opposes EIP999 is ignorant. As you'll see later, there are rational & well-thought out reasons to oppose EIP999. But the unfortunate reality is that many people who are participating in this debate do not fully understand what they're debating.

As /u/ZergShotgunAndYou mentioned in his post "EIP 999 IS controversial":

> It's a bailout pure and simple.

Face it, learning is hard. Maybe we only have a loose idea of what bailouts are. Maybe we don't have the technical background to understand the formal tech specs. Maybe we just like to repeat what other people tell us.

Most of us have day jobs or schoolwork that consumes most of our brain power and we don't have the time & energy to spend our evenings reading the [yellow paper](https://ethereum.github.io/yellowpaper/paper.pdf). That's fine, there's absolutely nothing wrong with ignorance. I'm ignorant about most things and happy to admit it.

But we ought to keep in mind that the [Dunning-Kruger](http://ypsgroup.com/wp-content/uploads/2015/08/Dunning-Kruger-Effect-300x238.jpg) effect correlates confidence with incompetence.

The universe is under no obligation to be simple and if the EIP999 decision were simple, there wouldn't be a debate. I encourage you to be extremely wary of anyone who claims this situation is "pure and simple" (let alone a bailout).

To clarify a few commonly misunderstood points:
 - [EIP999](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-999.md) is proposing we re-instate the destroyed code (with the self-destruct button removed) that controls a collection of multi-sig wallets.
 - [A bailout is an act of giving financial assistance to a failing business or economy to save it from collapse.](https://www.google.com/search?q=bailout)
 - EIP999 is not giving financial assistance to anyone, it would allow people to regain access to their own money. Nor is EIP999 saving anything from collapse, Ethereum will keep chugging along regardless of whether EIP999 passes or not.
 - Parity is not the one who had Eth locked by the contract's destruction. It's companies that used parity's wallets like Polkadot, ICONOMI, Musiconomi, [etc](https://elementus.io/blog/which-icos-are-affected-by-the-parity-wallet-bug/).
 - [Gav Wood](http://gavwood.com/) is the founder of both Polkadot and Parity, therefore he obviously has financial incentive to restore these funds. This connection seems to be why people think Parity has something to gain financially from EIP999 passing.

Another manifestation of ignorance is people whose economic knowledge stops at supply and demand. I've seen comments that are laser focused on this one aspect thinking "locked coins decreases supply, therefore my coins are worth more" but, in reality, the price of Eth is multi-dimensional. Supply & demand is a drop in the bucket compared to factors like confidence in the platform.

## 2. Religious purity

In his book [Sapiens](https://sites.google.com/site/taborsapiens/home/10-the-law-of-religion), Dr. Harari defines religion as:

> a system of human laws and values, which is founded on a belief in a super human order.

Traditionally, the "super human order" has been one or many Gods but, in Buddism for example, the super human order is a natural law: suffering stems from desire. 

Under this definition, capitalism, communism, and, of course, Ethereum are also religions where the super human order takes the shape of an [invisible hand](https://en.wikipedia.org/wiki/Invisible_hand), equality, or the EVM.  Particular religions rise and fall but the religious instinct to have faith in a super human order (or Truth with a capital T) lives on in all of us.

In addition to faith, we have another instinct for cleanliness that evolved to keep us safe from disease. These instincts come together in this EIP999 debate to produce a repulsion to violating the holy immutability of the blockchain. 

But they also come together to help a staggering number of completely different humans cooperate so the last thing we want to do is get rid of these instincts. They are invaluable. Cryptocurrency won't work unless we can all agree on certain Truths and a large fraction of the space has decided that the irreversibility of mistakes is one of them.

Personally, I have unshakable faith in Ethereum's censorship resistance and it should be noted that this can exist independently of faith in the Truth of Irreversible Mistakes.

## 3. Fairness

The Truth of Irreversible Mistakes was likely hammered into many people's head when they accidentally sent some Eth to an improperly initialized parity seed or had their funds compromised by malware. They realized they have absolutely no recourse and saw the Truth: mistakes are irreversible. After something like this happens to you, it's not hard to image taking the stance "If I can't have my mistakes fixed, then nobody should be able to."

Most mistakes do not have a universal way to undo them:
 - Did malware really steal your funds or are you the scammer trying to steal someone else's funds?
 - When that address sent funds to 0x000, was it a mistake or was it the ENS contract doing a controlled [burn](https://docs.ens.domains/en/latest/faq.html#instead-of-burning-funds-in-the-auction-for-bidding-costs-and-penalties-shouldnt-they-be-donated-to-the-ethereum-foundation)?
 - Who *really* owned the funds that were sent to the default address generated by an [empty parity seed](https://github.com/paritytech/parity/issues/5691) if they came from an exchange-controlled address?

By a quirk of fate, these mistakes require case-by-case attention and can therefore not be cleanly reversed by one single change to the EVM state.

As /u/Crypto_Economist42 mentioned in his post "Why should the Parity Multisig Wallet be bailed out when all the other contract mistakes and Ether losses aren't?":

> That just isn't fair

I 100% agree, it's not fair at all.

## 4. Reputation Damage

This one comes from an understanding of point 2. We have to realize that, if a lot of people have deep faith in the Truth of Irreversible Mistakes, then proceeding with EIP999 exposes the ecosystem to the undue risk of a contentious fork, even if the change itself would be a net benefit.

In his article [Avoid Evil Twins](https://medium.com/@avsa/avoid-evil-twins-every-ethereum-app-pays-the-price-of-a-chain-split-e04c2a560ba8), [Alex](https://medium.com/@avsa) points out that the state of Ethereum now is *very* different than it was during the fork following the DAO recovery. TL;DR a persistent chain split would likely cause the Ethereum ecosystem to collapse.

I don't have hard evidence to back this up, but combining the investments made into Ethereum with the catastrophic downside of a persistent split leads me to conclude that one of the forked coins will not be stable and quickly die off.

Will the gold held by [DigixDAO](https://digix.global/dgd/) be honored on this chain or that one? They will have to make a firm decision and one team's decision will massively influence other teams to make the same decision as the community quickly coalesces onto one chain or the other.

Therefore, I've chosen to label the danger of a split as "reputation damage" rather than "death by evil twin".

Not to say reputation damage can't be catastrophic, it definitely could be and is something worth worrying about.

## 5. Slippery Slope

Scott Alexander provides a fantastic introduction to the concept of a [Schelling Fence](https://www.lesswrong.com/posts/Kbm6QnJv9dgWsPHQP/schelling-fences-on-slippery-slopes):

> Slippery slopes legitimately exist wherever a policy not only affects the world directly, but affects people's willingness or ability to oppose future policies. Slippery slopes can sometimes be avoided by establishing a "Schelling fence" - a Schelling point that the various interest groups involved - or yourself across different values and times - make a credible precommitment to defend 

So as we consider changing the state of the EVM outside of it's coded rules, we have to decide where to draw the line. Censorship: definitely bad. Fixing the DAO hack: turned out alright.

This little bug fix is so simple and will restore so much Eth to so many people, this has got to be justified right? But this is just one more step towards mutating the state for less justified reasons and preventing that is one of the biggest things that excite people about cryptocurrencies.

More importantly, if we make this change then we'll be in a new mindset in which mutating the state is just a little bit more normal. We might be just a little bit more likely to make unjustified changes in the future and that's a bad path to be on.

It makes sense to say we've got to draw a line in the sand. We've got to set a credible Schelling fence that we can defend and say "absolutely no more". The most obvious Shelling point for mutating the "immutable" blockchain is zero but we passed that so "only 1" is the next most justified and defensible position.

## 6. Moral Hazard

According to [Investopedia](https://www.investopedia.com/ask/answers/09/moral-hazard.asp), Moral hazard is the idea that a party protected in some way from risk will act differently than if they didn't have that protection. The textbook example: if I get health insurance then I'm more likely to behave recklessly and possibly injure myself.

It's hard to find sources for this but it sounds like the Parity contracts were only audited in-house and you can't help but wonder whether this would even be an issue if they had also hired a 3rd party auditor.

If we fix this team's mistake then we're validating not-best-practices. We'd be making a point that if developers deploy bugs then the entire community will go through this drama-filled process of hard forking to change the EVM state.

The end result: sloppy developers who are more likely to deploy bugs. A horrible outcome.

## Personal Opinion

We all know those famous words, both a warning and the genesis of a whole new age:

> The times 03/Jan/2009 Chancellor on brink of second bailout for banks

In the cryptocurrency community, the term "bailout" is about as emotionally loaded as the idea of Satan is to a Christian. Attaching this completely unrelated term to EIP999 is effectively a smear campaign and I'm dismayed by how well it seems to have worked.

As the title suggests, I am not faithful to the Truth of Irreversible Mistakes nor to the Truth of Fairness. But the reputation damage, slippery slope, and moral hazard have all given me pause.

**For the more mainstream investors who aren't faithful to the Truth of Irreversible Mistakes, fixing bugs like this might actually increase Ethereum's reputation. It's likely that it will give institutional investors more peace of mind while investing large sums of money into the space. A hard fork here says loud and clear that if institutional investors follow best practices, then stupid little bugs are unlikely to cause catastrophic loss of funds.

Selfishly, I like the idea of sending that message to institutional investors and I have high hopes for what it might do to the price of Eth long-term.**

As far as the slippery slope, I say we define our Schelling fence at absolutely zero non-bugfix changes. A Schelling point of absolute zero is so much easier to justify than "just this one time" so, in my mind, I choose to divide state changes into categories: bugfixes and non-bugfixes.

Slippery slopes only exist within a category so putting bug fixes and censorship in separate categories lets me sleep well at night knowing that we have a well-defined and easily justified Schelling fence in place that ensure fixing bugs will never devolve into censoring transactions, etc.

And the moral hazard? Whatever, the Parity devs have learned their lesson. I don't find this argument particularly compelling.

I am planning on [voting Yes on EIP999](https://www.etherchain.org/coinvote/poll/35) a few hours before the vote ends but I'd like to wait and see if any of the thoughts you share in the comments change my mind. I do my best to maintain strong beliefs, loosely held and am open to changing my mind on this topic. Did I leave out any compelling arguments against EIP999? Did I strawman any of the provided arguments? I look forward to hearing your thoughts.

## Incentive disclosure

None of my money was lost by the multi-sig contract's untimely suicide so I have nothing to *directly* gain from unfreezing the locked funds. However, I have heavily invested my time & money into Ethereum and have a strong incentive to see it succeed long term.

Also, My Ethereum address is 0x1057Bea69c9ADD11c6e3dE296866AFf98366CFE3 and I have a financial incentive to write a thought-provoking post with a click-bait title that might draw a crowd and inspire people to tip me. ;) I'm a recent college grad who walked away from stable employment to coast on savings while I hack with Ethereum full-time so any tips will be extra appreciated.

[twitter @bohendo](https://twitter.com/bohendo)
[github @bohendo](https://github.com/bohendo)
