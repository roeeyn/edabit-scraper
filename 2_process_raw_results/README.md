# 2. Process Result From Previous Step

Once I got the results from the previous step from ZAP, I needed to parse it, so I can get a nice json for easier further processing. 
For this I used Elixir (just because I think it's a great opportunity to practice).

## 2.1 Preparation & Dependency Insatallation

For executing this, you need elixir installed, after that, you can install the dependencies with:

```bash
mix deps.get
```

After this just copy your results in the `assets` folder.

## 2.2 ProcessRawResult module

Execute the module with

```bash
iex -S mix
```

And get your parsed jsons in the `assets` folder as well with:

```iex
iex(1)> ProcessRawResult.raw_result_to_json "assets/java_860_exercises_indexes_payload_result.txt"
:ok
iex(2)> ProcessRawResult.raw_result_to_json "assets/js_2430_exercises_indexes_payload_result.txt" 
:ok
iex(3)> ProcessRawResult.raw_result_to_json "assets/python_2510_exercises_indexes_payload_result.txt"
:ok
iex(4)> 
```
