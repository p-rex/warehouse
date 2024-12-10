from falconpy import CSPMRegistration
import os
import pandas as pd

##---------------------------------------------------
## variables
##---------------------------------------------------

csv_filename = 'all_cspm_policies.csv'

##---------------------------------------------------
## functions
##---------------------------------------------------

def writeToCSV(data, filename):
    df = pd.json_normalize(data)
    df.to_csv(filename, index=False, encoding='utf-8')


##---------------------------------------------------
## main
##---------------------------------------------------

#Set API Credential
falcon_client_id = os.environ['FALCON_CLIENT_ID']
falcon_client_secret = os.environ['FALCON_CLIENT_SECRET']


falcon = CSPMRegistration(client_id=falcon_client_id, client_secret=falcon_client_secret)


# get all policy ids
print("Get policy ids")
all_policies = falcon.get_policy_settings()
id_list = []
for policy in all_policies['body']['resources']:
    id_list.append(policy['policy_id'])


# Get policy details
print("Get policy details")
all_policy_details = falcon.get_policy(ids=id_list)

# Write to csv
print("Write to csv")
writeToCSV(all_policy_details['body']['resources'], csv_filename)

# Done
print('')
print(f'{csv_filename} was created')
