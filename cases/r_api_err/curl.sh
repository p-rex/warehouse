from falconpy import ContainerImages
import os
import pandas as pd


falcon_client_id = os.environ['FALCON_CLIENT_ID']
falcon_client_secret = os.environ['FALCON_CLIENT_SECRET']


falcon = ContainerImages(client_id=falcon_client_id, client_secret=falcon_client_secret)
resp = falcon.get_combined_images(sort="first_seen", limit=1)
print(resp)
