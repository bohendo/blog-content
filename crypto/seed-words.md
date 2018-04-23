
# Seed Words

I use MetaMask and want to know how their seed words work since they're so important.

## Stack Trace

I started out by exploring the [MetaMask source code][metamask-source]

The API is defined in the [MetaMask Controller][metamask-controller] and features a method called `createNewVaultAndKeychain`, this will be the beginning of our stack trace.

[`MetamaskController.createNewVaultAndKeychain`][https://github.com/MetaMask/metamask-extension/blob/master/app/scripts/metamask-controller.js#L444]
[`KeyringController.createNewVaultAndKeychain`][https://github.com/MetaMask/KeyringController/blob/master/index.js#L69]
[`KeyringController.createFirstKeyTree`][https://github.com/MetaMask/KeyringController/blob/master/index.js#L330]
[`KeyringController.addNewKeyring`][https://github.com/MetaMask/KeyringController/blob/master/index.js#L157]
[`HdKeyring.constructor({ numberOfAccounts: 1 })`][https://github.com/MetaMask/eth-hd-keyring/blob/master/index.js#L15]
[`HdKeyring.addAccounts`][https://github.com/MetaMask/eth-hd-keyring/blob/master/index.js#L47]
[`bip39.generateMnemonic()`][https://github.com/bitcoinjs/bip39/blob/master/index.js#L115]
[`bip39.entropyToMnemonic(rng(16),wordlist)`][https://github.com/bitcoinjs/bip39/blob/master/index.js#L115]

[`rng(16)`][https://github.com/crypto-browserify/randombytes] is just a wrapper around the random number generator in either node.js or the browser, it just returns 16 random bytes.

## BIP39 Mnemonic Generation

`bip39.entropyToMnemonic()` is the function that does the heavy lifting & returns our mnemonic phrase. It's not that complicated either:

```javascript
function entropyToMnemonic (entropy, wordlist) {
  if (!Buffer.isBuffer(entropy)) entropy = Buffer.from(entropy, 'hex')
  wordlist = wordlist || DEFAULT_WORDLIST

  // 128 <= ENT <= 256
  if (entropy.length < 16) throw new TypeError(INVALID_ENTROPY)
  if (entropy.length > 32) throw new TypeError(INVALID_ENTROPY)
  if (entropy.length % 4 !== 0) throw new TypeError(INVALID_ENTROPY)

  var entropyBits = bytesToBinary([].slice.call(entropy))
  var checksumBits = deriveChecksumBits(entropy)

  var bits = entropyBits + checksumBits
  var chunks = bits.match(/(.{1,11})/g)
  var words = chunks.map(function (binary) {
    var index = binaryToByte(binary)
    return wordlist[index]
  })

  return wordlist === JAPANESE_WORDLIST ? words.join('\u3000') : words.join(' ')
}

function bytesToBinary (bytes) {
  return bytes.map(function (x) {
    return lpad(x.toString(2), '0', 8)
  }).join('')
}

function deriveChecksumBits (entropyBuffer) {
  var ENT = entropyBuffer.length * 8
  var CS = ENT / 32
  var hash = createHash('sha256').update(entropyBuffer).digest()

  return bytesToBinary([].slice.call(hash)).slice(0, CS)
}

```




---

[metamask-source]: https://github.com/MetaMask/metamask-extension "MetaMask Source Code"
[metamask-controller]: https://github.com/MetaMask/metamask-extension/blob/master/app/scripts/metamask-controller.js "MetaMask Controller"
[metamask-new-keyring]: https://github.com/MetaMask/metamask-extension/blob/master/app/scripts/metamask-controller.js#L455 "MetaMask New Keyring"

[keyring-source]: https://github.com/MetaMask/KeyringController "KeyringController Source Code"
[keyring-add-new-keyring]: https://github.com/MetaMask/KeyringController/blob/master/index.js#L69 "KeyringController Add New Keyring"

[hdkeyring]: https://github.com/MetaMask/eth-hd-keyring/blob/master/index.js "HD Keyring"

[bip39-source]: https://github.com/bitcoinjs/bip39/blob/master/index.js "BIP39 Source Code"

[bip32]: require://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki "BIP32"
[bip39]: require://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki "BIP39"
[bip44]: require://github.com/bitcoin/bips/blob/master/bip-0044.mediawiki "BIP44"

