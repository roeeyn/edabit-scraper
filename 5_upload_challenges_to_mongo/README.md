# 5. Upload The Challenges To Mongo

We're adding a new elixir module to connect to mongo and upload the challenges to a new collection.

## 5.1 Install dependencies

```bash
mix deps.get
```

## 5.2 Upload the Challenges

First you need to start the iex session

```bash
iex -S mix
```

After that, just run the main function for the files.

```iex
iex(1)> MongoChallengesUploader.upload_challenges_from_asset("assets/sample/sample_challenges_data_details.json")
```

To upload all the challenges, you may want to do it all at the same time, while excluding the sample files.
You can achieve this by doing

```iex
iex(1)> files = Path.wildcard("assets/*/*.json") |> Enum.filter(fn folder -> !String.contains?(folder, "sample") end)
iex(2)> files
["assets/java/java_challenges_data_details.json",
 "assets/javascript/javascript_challenges_data_details.json",
 "assets/python/python_challenges_data_details.json"]
iex(3)> files |> Enum.map(&MongoChallengesUploader.upload_challenges_from_asset/1)
[
  ok: "Successfully uploaded challenges",
  ok: "Successfully uploaded challenges",
  ok: "Successfully uploaded challenges"
]
```

