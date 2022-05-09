defmodule ProcessRawResult do
  @moduledoc """
  This module process the last response of the websocket obtained through
  the ZAP API, which contains the exercises identifiers. We intend to format
  this messages as json, so we can use this files later for easier details fetching.
  """
  alias ProcessRawResult.Impl.RawProcessor

  defdelegate get_payload_from_raw_result(result_file_path), to: RawProcessor
  defdelegate get_payload_from_raw_result!(result_file_path), to: RawProcessor
  defdelegate write_payload_to_json_file(processed_payload), to: RawProcessor
  defdelegate write_payload_to_json_file(processed_payload, output_file), to: RawProcessor

  @doc """
  This is the main process of transforming the raw result message to a json file.
  """
  def raw_result_to_json(result_file_path) do
    File.read!(result_file_path)
    |> ProcessRawResult.get_payload_from_raw_result!()
    |> ProcessRawResult.write_payload_to_json_file("#{result_file_path}.json")
  end
end
