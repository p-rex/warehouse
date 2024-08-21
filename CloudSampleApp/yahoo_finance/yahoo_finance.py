import urllib.request
import time

# vars
url = 'https://query1.finance.yahoo.com/v8/finance/chart/USDJPY=X?interval=1d'
sleep_sec = 60


while True:
    with urllib.request.urlopen(url) as response:
        body = response.read()
        decoded_body = body.decode('utf-8')
        print(decoded_body)

    time.sleep(sleep_sec)


