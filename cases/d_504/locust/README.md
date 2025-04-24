# Locust test environment

## Dir
```
[ssm-user@ip-10-0-11-115 my-locust]$ pwd
/home/ssm-user/my-locust
[ssm-user@ip-10-0-11-115 my-locust]$ tree
.
├── locustfile.py
├── results_no_falcon
│   ├── loadtest_exceptions.csv
│   ├── loadtest_failures.csv
│   ├── loadtest_stats.csv
│   └── loadtest_stats_history.csv
└── results_with_falcon
    ├── loadtest_exceptions.csv
    ├── loadtest_failures.csv
    ├── loadtest_stats.csv
    └── loadtest_stats_history.csv

2 directories, 9 files
[ssm-user@ip-10-0-11-115 my-locust]$
```

## Docker commands
### No Falcon
```
docker run -d --rm \
  -v "$PWD/locustfile.py:/mnt/locustfile.py" \
  -v "$PWD/results_no_falcon:/mnt/results" \
  locustio/locust \
  -f /mnt/locustfile.py \
  --host=http://10.0.11.230 \
  --headless \
  -u 2 -r 2 \
  --run-time 24h \
  --csv=/mnt/results/loadtest
```

### With Falcon
```
docker run -d --rm \
  -v "$PWD/locustfile.py:/mnt/locustfile.py" \
  -v "$PWD/results_with_falcon:/mnt/results" \
  locustio/locust \
  -f /mnt/locustfile.py \
  --host=http://10.0.11.80 \
  --headless \
  -u 2 -r 2 \
  --run-time 24h \
  --csv=/mnt/results/loadtest
```
