This repo is for testing the [quorum change](https://github.com/klaytn/klaytn/pull/2026) in case of 4x+1 validators.

## Prerequisites

- dependencies

```bash
brew install jq
```

- kcn-v1.11.1 and kcn-v1.12.0 at this directory

## Run

If a local network is running, run:

```
./run stop
./run clean
```

Spawn a new local network:

```
homi setup --cn-num 9 --baobab-test --mnemonic test,junk --patch-address-book --patch-address-book-addr 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --randao-compatible-blocknumber 999999999 --cancun-compatible-blocknumber 999999999 local

./run setup
./run start
./test1.sh
./view.sh 0 1 60
```

Keep in mind that every test script must be run from a fresh network.
