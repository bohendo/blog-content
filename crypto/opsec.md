# Operations Security

I don't believe in security through obscurity.

Knowing how my opsec works shouldn't make it meaningfully weaker.

If that *is* the case, then I'd rather find out sooner rather than later.

:boom:

## Wallets 101

Wallets can be :fire: hotter or :snowflake: colder.
 - :fire: Hot wallets are very quick & easy to access but that also exposes them to more risk, making them more likely to get lost of hacked.
 - :snowflake: Cold wallets optimize for security at the expense of usability. They're less convenient to use but generally less at risk.

Maybe someday the hot/cold wallet distinction will fade as security & user experience improvements make wallets that are both quick to use & secure.. But I doubt it. I kinda think that security vs ease-of-use is a fundamental trade off, you can only improve one so much w/out sacrificing the other. Smart contract wallets like Argent might prove me wrong here (I hope they do).

2 Big things wallets need to protect against:
 1. Theft eg someone breaks into your wallet to steal your secrets
 2. Loss eg you lose a :key: key or forget a password

Setting up a :snowflake: cold wallet that's so secure not even you can access it is just as bad as setting up a :fire: hot wallet that's so quick & easy anyone can use it.

### Paper Wallet :pencil:

The ultimate :snowflake: cold wallet: good old fashion pencil & paper. Paper is utterly un-hackable if you're careful of cameras & eyeballs while reading/writing it.

A notecard hidden in some nook only I know about (but somewhere that might still be searched by loved ones when I die) is good, somewhere safe that definitely won't get wet or catch on fire.

Off-site backups are a good idea for the most important secrets eg :snowflake: cold crypto backup phrases.

In my paper wallets I store (not all on the same one):
 - Full backup of my :thinking: brain wallet
 - :passport_control: 2FA backup codes
 - Backup seed phrases for :snowflake: cold crypto

### :fire: Cold Crypto

Fancy cryptocurrency stuff needs a bit of computation power, pencil & paper won't cut it here.

We want to be able to create digital signatures w/out exposing the naked secret any more than necessary.

I bought a hardware wallet & recommend you do too if you're holding crypto worth more than 10x the price of one.

### :fire: Hot Crypto

Metamask, Argent, Mosendo, other mic crypto wallets apps.

My main :fire: hot wallet mnemonic (bohendo.eth) is loaded into several apps (eg metamask for desktop & mobile) and it's mnemonic is backed up in the :bank: vault.

I rarely store more than 1% of my funds in it & mostly use it for day-to-day crypto tinkering & experimenting.

but most of them hold little/no funds & aren't backed up at all.

### :thinking: Brain Wallet

:thinking: Brain wallet tip #1: if it's important, then I always write it down too :pencil:.

> Doesn't this make your brain wallet less secure?

Less secure from what? There are two ways to lose access to these funds: someone steals them or I accidentally lose them. A :thinking: brain wallet without a backup is vulnerable to being destroyed via concussion or, more often, forgetfulness.

I'm not immortal either & I don't want any of my important secrets to be burned along with me at the crematory (except for *those* secrets of course :wink:).

My :thinking: brain wallet is for convenience, not for anything mission-critical.

I write down everything in my brain wallet at least once per week. As far as I'm concerned, anything that I don't need access to at least once/week doesn't belong in my brain. That can go onto :pencil: paper or into the :bank: vault instead.

One exception is the 2FA keys needed to pass The Hangover Scenario :beers:. I actually don't have a good strategy for remembering these.

In my :thinking: brain wallet I store:
 - 2 :muscle: Strong Passwords
 - Location of the secret stash in the :bank: vault
 - 2 Important 2FA Codes :passport_control: (todo)

I have a hardware wallet for running secure crypto 

## :muscle: Strong Passwords

How strong is a :muscle: Strong Password?

My favorite alphabet to use while generating passwords is `[a-zA-Z0-9]` aka all letters upper & lower case plus numbers. It's easier to type if needed and less ugly.

This password alphabet has `26 + 26 + 10 = 62` letters in it so eg there are `62 * 62 = 62^2 = 3844` possible 2 letter passwords.

How many tries per second?

letters long | possibilities | time to crack
2 | 3844 | 1s

The first Strong Password :muscle: protects :key: key to my :bank: Vault which 

The second Strong Password :muscle: protects my various other :key: files eg ssh keys (and pgp encryption keys if I ever actually used those :wink:).

To memorize random strings of letters & numbers in the first place, muscle memory's where you want to store it. Open a temp note & just write it over and over 25 or 50 times. Then, leave it as the unlock code for your computer for week or so to really let it sink it before re-assigning it to it's final resting place.

I don't cycle my passwords very frequently, once every couple years maybe. If I ever had reason to be suspicious, I'd set aside 20 mins to write some new random letters over and over.

## :bank: Vault

aka a Password Manager (eg KeePassX)

Contains passwords for stuff like Google, Amazon, Netflix, etc and some Crypto Hot Wallets :fire:.

My vault :bank: itself is saved to a :cloud: cloud storage service (eg Dropbox) so I can easily sync new accounts between my devices.

To access

 1. :bank: :cloud: The Password Vault from cloud storage
 2. The vault Key :key: file, contained in the secret stash that was copied from old device -> new device via usb cable.
 3. A Strong Password :muscle: stored in my brain


## :passport_control: 2FA Devices

eg Phone w Google Auth

Several important accounts are protected with a :passport_control: 2FA Device.

Important 2FA backup codes are written down in :pencil: paper wallets.

A couple *very* important ones (see [The Hangover Scenario](#the-hangover-scenario)) are also in my :thinking: brain wallet.

## :key: Key Stash

Folder of :key: key file & other secrets.

Stored on 2-3 devices, never uploaded to the cloud, only ever transferred between devices via usb cable.

Should I hide an encrypted copy of the :key key stash somewhere to make the Hangover Scenario easier?

## Scenarios

### The Hangover Scenario :beers:

I wake up on a park bench in a strange looking city & have no clue how I got there. I don't have my phone or my wallet or anything more than my clothes (which I are very grateful for).

How do I get home?

I go out & wander around looking for a public library. I find one & connect to the internet.

Luckily, I have my google password memorized. I don't have any 2FA devices :passport_control: but I have a couple 2FA recovery tokens in my Brain Wallet :thinking: that I can use to log in.

:boom:

Got access to my email & can

### The Evil Sysadmin Scenario :smiling_imp:

A hacker stole some of the NSA's cyber-weapons & deploys a browser zero-day exploit. I visit a bad website & get pwned.

Having complete access to my computer & phone means the evil sysadmin has my :key: key stash and my encrypted :bank: vault but no :muscle: passwords.. Yet.

With root access, the hacker can install a keylogger to record my passwords & gain access to my :bank: vault.

They can then access all non-2FA protected accounts & steal money from my :fire: hot crypto wallets.

When they're done, they encrypt everything they have access to & say "give me your cold crypto keys to decrypt your stuff"

What do I do?
