# Get CSPM Policies

Get all cspm policies.

# Usage
Create API credential with the following scope in Falcon console.
```
CSPM Registration: read
```

Set environmental variables.
```
export FALCON_CLIENT_ID=XXXXXXXXX
export FALCON_CLIENT_SECRET=YYYYYYYYY
```

Execute.
```
curl -s https://raw.githubusercontent.com/p-rex/warehouse/refs/heads/main/CS_Script/get-cspm-policies/get-cspm-policies.py \
 | python3
```

## Sample output
### Terminal
```
% curl -s https://raw.githubusercontent.com/p-rex/warehouse/refs/heads/main/CS_Script/get-cspm-policies/get-cspm-policies.py \
 | python3
Get policy ids
Get policy details
Write to csv

all_cspm_policies.csv was created
```

### CSV
```
ID,CreatedAt,UpdatedAt,DeletedAt,description,policy_statement,policy_remediation,cloud_service_subtype,cloud_document,mitre_attack_cloud_matrix,mitre_attack_cloud_subtype,alert_logic,api_command,cli_command,cloud_platform_type,cloud_service_type,default_severity,cis_benchmark_ids,nist_benchmark_ids,pci_benchmark_ids,hipaa_benchmark_ids,hitrust_benchmark_ids,policy_type,tactic_url,technique_url,tactic,technique,tactic_id,technique_id,fql_policy,asset_type_id,cloud_asset_type,is_remediable,is_enabled,account_scope,cloud_service_id,resource_type_id,resource_type_friendly_name,soc2_benchmark_ids,attack_types,deprecated,policy_severity_score,policy_confidence_score,attack_tool,iso_benchmark_ids,cisa_benchmark_ids,attack_tool_command,remediation_summary
457,2021-08-16T22:13:01.002045Z,2023-10-18T20:19:27.057391Z,,"A customer built SSL policy attached to an SSL proxy is configured with an SSL policy having TLS version 1.1 or lower. As a best security practice, use TLS 1.2 as the minimum TLS version in your load balancers SSL security policies. TLS 1.2 allows the use of more secure algorithms such as SHA-256 and allows for the use of advanced cipher suites.",Cloud Load Balancing SSL proxy custom SSL policy configured with a vulnerable SSL protocol,"<ol>
  <li>If the TargetSSLProxy does not have an SSL policy configured, create a new SSL policy</li>
  <li>Otherwise, modify the existing insecure policy</li>
~~~cut~~~
```
