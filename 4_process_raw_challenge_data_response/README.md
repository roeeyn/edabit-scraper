# 4. Process Challenge Details

## 4.1 Get the Challenge Details

Start the iex with the mix
```bash
iex -S mix
```

```iex
iex(1)> ProcessRawChallengeDataResponse.raw_results_to_json "javascript"
```

## 4.2 Get the json output

The previous script will create a json file in the `assets` folder too.

> I had to compress the output as it exceeds the limit from GitHub.

You can validate the output with `jq`, with something like this:

```bash
cat javascript_challenges_data_details.json | jq '.[0]' | jq '._id'
cat javascript_challenges_data_details.json | jq '.[0] | keys'
cat javascript_challenges_data_details.json | jq '. | length'
```