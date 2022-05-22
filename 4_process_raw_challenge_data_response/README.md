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

## 4.3 Obtained results

After getting the details of each one of the exercises, we obtained the following results:
- **2424** JavaScript exercises (6 exercises discarded)
- **2504** Python exercises (6 exercises discarded)
- **848** Java exercises (12 exercises discarded)

These results vary from the one planned in the first step, but in the first step there were some duplicated ids, and also some of the discarded exercises included errors. This means that we're keeping a good amount of exercises with good quality too.