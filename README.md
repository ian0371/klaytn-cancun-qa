## Prerequisites
- target kcn should be in "$PATH" (see `cmd/setup.sh:8`)

## Run

At first run:
```
homi setup local --cn-num 4
./run setup
./run start
```

Restart at binary update:
```
./run stop
./run clean
./run setup
./run start
```

> :warning: only running kcn is supported
