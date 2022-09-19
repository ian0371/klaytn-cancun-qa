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

## Console attach
```
kcn attach http://localhost:8551
kcn attach http://localhost:8552
kcn attach http://localhost:8553
kcn attach http://localhost:8554
```

## Logs
```
tail -F output/cn1/data/log/kcnd.out
tail -F output/cn2/data/log/kcnd.out
tail -F output/cn3/data/log/kcnd.out
tail -F output/cn4/data/log/kcnd.out
```
