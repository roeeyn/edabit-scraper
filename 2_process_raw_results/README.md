# 2. ProcessRawResult

```iex
iex(1)> ProcessRawResult.raw_result_to_json "assets/java_860_exercises_indexes_payload_result.txt"
:ok
iex(2)> ProcessRawResult.raw_result_to_json "assets/js_2430_exercises_indexes_payload_result.txt" 
:ok
iex(3)> ProcessRawResult.raw_result_to_json "assets/python_2510_exercises_indexes_payload_result.txt"
:ok
iex(4)> 
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `process_raw_result` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:process_raw_result, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/process_raw_result>.

