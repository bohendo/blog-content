# Operations Security

:boom:

I don't believe in security through obscurity. Knowing how my opsec works shouldn't make it meaningfully weaker. If that's the case, then I'd rather find out sooner rather than later so I can fix it.

## Strong passwords



## Password Strength

How strong is a :muscle: Strong Password?

A good alphabet to use while generating passwords is `[a-zA-Z0-9]` aka all letters upper & lower case plus numbers. It's easier to type if needed and less ugly.

This password alphabet has `26 + 26 + 10 = 62` letters in it so eg there are `62 * 62 = 62^2 = 3844` possible 2 letter passwords.

letters

## Wallets

Overview of all the different places I store secrets.

### Paper Wallet :pencil:

Good old fashion pencil & paper.

NOT anything remotely digital. Not a note on my phone, not a file on my computer. Just good old fashion pencil & paper.

A notecard hidden in some nook only I know about (but somewhere that might still be searched by loved ones when I die) is good.

Paper is utterly un-hackable (if you're careful of cameras while reading/writing it). Store it somewhere safe that definitely won't get wet and won't catch on fire.

In my Paper Wallets I store:
 - Brain wallet :brain: backup.
 - Important 2FA :passport_control: codes

I store my brain wallet :brain: backup in a Paper Wallet :pencil:.

### Brain Wallet :brain:

Secrets that only I know.

:brain: Brain wallet tip #1: if it's important, then write it down :pencil:.

Does this make your brain wallet less secure?

Less secure from what? There are two ways to lose access to these funds: someone steals them or you accidentally burn them. A brain wallet without a backup is vulnerable to burn-by-head-injury and, more often, forgetfulness.

You're not immortal either. Do you really want this secret to be burned along with you at the crematory?

Your :brain: brain wallet is for convenience.

Secondly, write it at least once per week. If you don't plan to write it frequently (eg to enter your password vault to sign into google) then it probably shouldn't be in your brain. Brain wallets are not the place to store something that you'll only need "just in case".

I unlock my ssh password every time I reboot my computer so that keeps it fresh.

To memorize random strings of letters & numbers in the first place, muscle memory's where you want to store it. Open a temp note & just write it over and over 25 or 50 times. Then, leave it as the unlock code for your computer for week or so to really let it sink it before re-assigning it to it's final resting place.

I don't cycle my brain wallet keys very frequently, once every couple years maybe. If I ever had reason to be suspicious, I'd set aside 20 mins to write some new random letters over and over.

In my :brain: brain wallet I store:
 - 2 :muscle: Strong Passwords
 - Important 2FA Codes :passport_control:

### Cold Wallet :snowflake:

Very secure, holds your crypto life savings. Relatively infrequently accessed.

If I were you, I'd buy a hardware wallet as soon as I planned on storing crypto worth >10x the price of a hardware wallet (~1000).

Someday I think Smart Contract wallets will make the best Cold Wallets :snowflake: but we're not there yet, I'm sticking w a hardware wallet.

My Cold Wallet is a 

### Hot Wallet :fire:

Metamask, browser extensions, in-app wallets, phone apps, smart contract wallets.

## System Architecture

The Keys to my Kingdom  32 randomly generated letters (`/dev/random`) split into two Strong Passwords :muscle: 16 letters each.

The first Strong Password :muscle: protects the Key :key: to my Vault :bank: (KeePassX) which contains passwords for stuff like Google, Amazon, Netflix, etc and some Crypto Hot Wallets :fire:.

The Password Vault :bank: itself is saved Dropbox so I can easily sync new accounts between my devices.

Eg, for a new device to sign into my Paypal account, it needs:

 1. The Password Vault :bank: from Dropbox
 2. A Strong Password :muscle: stored in my brain
 3. The vault Key :key: file, copied from old device -> new device via usb cable.
 4. 2FA Device :passport_control: (only for a handful of important accounts eg the account that stores the Vault :bank:)

The second Strong Password :muscle: protects my ssh Keys :key: & I'd use it to protect pgp encryption keys if I ever actually used those.

The first half of of this second Strong Password :muscle: is the unlock code for my phone & computer. 

Several important accounts are also protected with a 2FA Device :passport_control: (Google Auth). Some of the 2FA recovery keys I put in my Vault :bank: alongside it's passwords which kinda defeats the purpose but I'm too lazy to write those down on note cards. The important ones are written down :pencil:. A couple *very* important ones (see [The Hangover Scenario](#the-hangover-scenario)) are also in my brain wallet.

## The Hangover Scenario :beers:

To prepare for the worst, all you need to add to your brain wallet is: 
 - Google password + a couple 2FA recovery tokens

See notes re brain wallets, it's hard to maintain them long enough to be effective if the "just in case" situation happens. I don't have a super good solution for this yet. Just crossing my fingers.

You wake up in a strange looking city & have no clue how you got there. You don't have your phone or your wallet or your passport or anything more than your clothes (which you are very grateful for). How do you get home?

You go out & wander around looking for a public library. You find one & connect to the internet.

Luckily, you have your google password memorized. You don't have any 2FA devices :passport_control: but you have a couple 2FA recovery tokens in your Brain Wallet :brain: that you can

## The Evil Sysadmin Scenario :smiling_imp:

The NSA deploys a browser zero-day exploit, you visit a bad page

Someone captures my laptop & my

## Devices

2FA is on my phone.

