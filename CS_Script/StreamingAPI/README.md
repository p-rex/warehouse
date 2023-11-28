# Getting events via Streaming API
This script gets Falcon events via Streaming API and save it in local file.

# Usage
1. Create an API client in Falcon console. Scope: `Event streams: Read`
1. Download `config.env`. You may change the filename.
1. Modify config.env.
1. Execute commands.　If you change the filename of the `config.env`, change the `config.env` part of the command.
```shell
curl -sSL https://raw.githubusercontent.com/p-rex/warehouse/main/CS_Script/StreamingAPI/getEvents.sh | bash -s config.env
```
