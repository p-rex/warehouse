# 事前準備

## 環境変数
以下の環境変数を事前に設定
### API 
```
export FALCON_CLIENT_ID=
export FALCON_CLIENT_SECRET=
export FALCON_CID=
```

### Region
```
export FALCON_CLOUD_REGION=us-1
export FALCON_CLOUD_API=api.crowdstrike.com
```

## falconpyインストール
```
pip install crowdstrike-falconpy
```


# 実行
## curl
```
curl -s \
https://raw.githubusercontent.com/p-rex/warehouse/refs/heads/main/cases/r_api_err/curl.sh \
| bash
```

## python
```
curl -s \
https://raw.githubusercontent.com/p-rex/warehouse/refs/heads/main/cases/r_api_err/falconpy_test.py \
| python
```
