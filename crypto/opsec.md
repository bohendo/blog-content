# Operations Security
**aka Opsec**

This post outlines how I manage my crypto wallets, passwords, keys, and everything else related to my digital identity secure.

I don't believe in security through obscurity, knowing how my opsec works shouldn't make it meaningfully weaker. If it *does*, then I'd rather find out sooner rather than later.

:boom:

## Crypto Wallets

**At the heart of every crypto wallet rests the master secret: the mnemonic.** Also known as an extended private key, the mnemonic is the one secret that grants total control over some crypto wallet. Each mnemonic can control millions of different crypto accounts and, if the mnemonic is compromised, all associated accounts are compromised.

For example, a random mnemonic I just generated using [ethers](https://docs.ethers.io/v5/api/signer/#Wallet-createRandom) is:

```
suggest friend vibrant broom garbage nice vehicle enhance viable suggest stem panel
```

24-word mnemonics also exist, sometimes used by hardware wallets to backup their extended private key, but most mnemonics are 12 words long.

The Ethereum account at index 0 for the above mnemonic is `0xEDBDDe4FB975911741fc555a24bd89600ff541D0`. If this account (or any other account generated from this mnemonic) contained any money, then it would be quickly stolen now that the mnemonic is publicly available.

Crypto wallets can be hot or cold.
 - :fire: Hot wallets are very quick & easy to access because the mnemonic is stored on an internet-connected device. This also means that they're more vulnerable to being stolen. A real-world analogy would be the pocket money you carry around with you in your pocket.
 - :snowflake: Cold wallets optimize for security at the expense of usability, they ensure the mnemonic is kept offline & out of reach of any online attackers. They're less convenient to use but are harder to rob. A real-world analogy would be a safe deposit box at a bank or a stash of savings buried in your backyard.

Someday, the hot/cold distinction might fade as security & user experience improvements make wallets that are both quick to use & still super secure.. But I doubt it. I suspect that security vs ease-of-use is a fundamental trade off, you can only improve one so much w/out sacrificing the other. Smart contract wallets like [Argent](https://www.argent.xyz/) might prove me wrong here (and I hope they do).

2 big things that crypto wallets need to protect against:
- **Theft** ie someone breaks into your wallet to steal your mnemonic. For example: you visit an evil website that hacks your computer, then the hacker finds your hot wallet's mnemonic and uses it to steal all the money it contains. Generally, hot wallets are at greater risk of theft than cold wallets.
- **Loss** ie you forget or lose access to your mnemonic. For example, you etch a cold wallet mnemonic onto some water-proof, fire-proof steel & bury it 6ft under on a large plot of land. A year later when you want to retrieve these funds, you can't remember where you buried it and, after digging a few hundred [holes](https://en.wikipedia.org/wiki/Holes_(film)), you give up & accept that these funds are lost forever. Generally, cold wallets are at greater risk of loss than hot wallets.

### :scroll: Paper Wallet

The safest possible cold wallet is tried and true: good ol pencil & paper. Paper is secured by it's simplicity: it's utterly un-hackable as long as you're careful of cameras & eyeballs peeking over your shoulder.

A notecard hidden in some nook only I know about (but somewhere that might still be searched by loved ones when I die) is good, somewhere safe that definitely won't get wet or catch on fire.

To make them more water/fire resistant, paper wallets can be laminated or made out of metal but it's the same idea. I generally view 2 copies of paper stored in different, secure locations as being more resistant to loss than one copy stored on metal but it's up to you.

Off-site backups are a particularly good idea for the most important secrets eg cold wallet mnemonics.

Across my paper wallets I store:
 - :thinking: Full backup of my brain wallet
 - :passport_control: 2FA backup codes
 - :snowflake: Backup seed phrases for cold crypto

### :snowflake: Cold Wallet

To actually *use* your cryptocurrency, we need a bit of computation power to generate the digital signatures, pencil & paper won't cut it here.

The goal is to use your mnemonic in cold-storage to generate a digital signature that will be shared with the world *without* exposing the secret in any way.

The best strategy is to only create digital signatures via a hardware wallet: dedicated hardware that does not include any generalized computer or, especially, any wifi antennas. It ought to be dead-simple, only capable of creating & exporting signatures. 

I bought a hardware wallet & recommend you do the same if you are holding (or plan to hold) crypto worth more than ~$2000 (aka more than 10x the price of a hardware wallet).

Alternatively, if you have an old laptop or smart phone, you can use these as cold wallets by keeping them on airplane mode or, even better, by opening them up & physically destroying any wireless antenas. [Air-gap that shit.](https://medium.com/blockchannel/mind-the-crypto-air-gap-89dd8650cba7) This way, you can use a USB drive to transfer a transaction to the air gapped computer, sign it, and use the USB drive to transfer it back to an internet-connected computer. As long as the USB isn't hacked, this is another (although, more complicated & error prone) way to manage a cold wallet.

### :fire: Hot Wallet

Hot wallets should be the first wallet you setup & get familiar with when experimenting with crypto. If you never store your life savings on the blockchain, a hot wallet might be the only crypto wallet you ever need.

Examples: [Metamask](https://metamask.io/), [Argent](https://www.argent.xyz/) & other crypto wallet apps that you download & use directly on an internet-connected device.

My main hot wallet mnemonic is loaded into several apps (eg the metamask browser plug-in on desktop & the mobile app on my phone) and it's mnemonic is backed up in my vault.

I rarely store more than 1% of my funds in it & mostly use it for day-to-day crypto tinkering & experimenting. It's fairly low-stakes so I don't worry about backing up this mnemonic on a paper wallet.

### :thinking: Brain Wallet

The #1 most important thing to remember about brain wallets: if it's important, then write it down :scroll:.

*But wait, doesn't this make your brain wallet less secure?*

Less secure from what threat? Remember that there are two ways to lose access to these funds: someone steals them or I accidentally lose them. A brain wallet without a backup is extremely vulnerable to being destroyed via concussion or, more often, forgetfulness.

I'm not immortal either & I don't want any of my important secrets to be burned along with me at the crematory (except for *those* secrets of course :wink:).

My brain wallet is for convenience, not for anything mission-critical.

I write down everything in my brain wallet at least once per week. As far as I'm concerned, anything that I don't need access to at least once/week doesn't belong in my brain. That can go onto paper or into the :bank: vault instead.

One exception is the 2FA keys needed to pass The Hangover Scenario. I actually don't have a good strategy for remembering these.

In my brain wallet I store:
 - :muscle: 2 Strong Passwords
 - :bank: Location of the secret stash in the vault
 - :passport_control: 2 Important 2FA Codes (TODO)

I have a hardware wallet for running secure crypto, the pin for this hardware wallet is stored in my brain too.

## :muscle: Strong Passwords

How strong is a Strong Password?

My favorite alphabet to use while generating passwords is `[a-zA-Z0-9]` aka all letters upper & lower case plus numbers. It's easier to type if needed and less ugly.

This password alphabet has `26 + 26 + 10 = 62` letters in it so eg there are `62 * 62 = 62^2 = 3844` possible 2 letter passwords.

How many tries per second?

letters long | possibilities | time to crack
2 | 3844 | 1s

The first Strong Password protects key to my :bank: Vault which 

The second Strong Password protects my various other files eg ssh & gpg keys.

To memorize random strings of letters & numbers in the first place, muscle memory's where you want to store it. Open a temp note & just write it over and over 25 or 50 times. Then, leave it as the unlock code for your computer for week or so to really let it sink it before re-assigning it to it's final resting place.

I don't cycle my passwords very frequently, once every couple years maybe. If I ever had reason to be suspicious, I'd set aside 20 mins to write some new random letters over and over.

## :bank: Vault

Aka a Password Manager eg I use [KeePassXC](https://keepassxc.org/).

Contains passwords for stuff like Google, Amazon, Netflix, etc and some crypto hot wallet mnemonics.

My vault itself is saved to a cloud storage service (eg Dropbox) so I can easily sync new accounts between my devices.

To access my vault, all of the following are required:
- :bank: The password vault file itself, stored on my computer and in cloud storage.
- :key: The vault Key file, contained in the secret stash that was copied from old device -> new device via usb cable.
- :muscle: A Strong Password stored in my brain

## :passport_control: 2FA Devices

eg Phone w [Authy](https://authy.com/) installed

Several important accounts are protected with a 2FA Device.

Important 2FA backup codes are written down in paper wallets.

A couple *very* important ones (see [The Hangover Scenario](#the-hangover-scenario)) are also in my brain wallet.

## :key: Key Stash

Folder of key file & other secrets.

Stored on 2-3 devices, never uploaded to the cloud, only ever transferred between devices via usb cable.

Should I hide an encrypted copy of the :key key stash somewhere to make the Hangover Scenario easier?

## Scenarios

### :beers: The Hangover Scenario

I wake up on a park bench in a strange looking city & have no clue how I got there. I don't have my phone or my wallet or anything more than my clothes (which I are very grateful for).

How do I get home?

I go out & wander around looking for a public library. I find one & connect to the internet.

Luckily, I have my email password memorized. I don't have any 2FA devices but I have a couple 2FA recovery tokens in my Brain Wallet that I can use to log in.

:boom:

Got access to my email & can send an SOS message to fam.

In the meantime, I also have a hot mnemonic in my brain wallet so I have some crypto available to spend. Now the challenging part: lure some local baker into this library so I can give her a payment in exchange for some lunch.

### :smiling_imp: The Evil Sysadmin Scenario

A hacker stole some of the NSA's cyber-weapons & deploys a browser zero-day exploit. I visit an evil website & get pwned.

Having complete access to my computer & phone means the evil sysadmin has my key stash and my encrypted vault but no passwords.. Yet.

With root access, the hacker can install a keylogger to record my passwords & gain access to my vault.

They can then access all non-2FA protected accounts & steal money from my hot crypto wallets.

When they're done, they encrypt everything they have access to & say "give me your cold crypto keys to decrypt your stuff"

What do I do?

Luckily, life savings are on a cold hardware wallet so those are safe. As for the rest, hmm this is hard to recover from. Idk what to do.
