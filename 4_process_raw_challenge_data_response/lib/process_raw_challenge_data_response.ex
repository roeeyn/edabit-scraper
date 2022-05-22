defmodule ProcessRawChallengeDataResponse do
  @moduledoc """
  This module process the websocket list of responses obtained from
  the ZAP API, which contains the exercises data. We intend to format
  this messages as json, so we can use this files later for easier further processing.
  """
  alias ProcessRawChallengeDataResponse.Impl.RawProcessor
  defdelegate get_message_from_raw_result(raw_result), to: RawProcessor
  defdelegate get_message_from_raw_result!(raw_result), to: RawProcessor

  defdelegate write_payload_to_json_file(processed_payload), to: RawProcessor
  defdelegate write_payload_to_json_file(processed_payload, output_file), to: RawProcessor

  @doc """
  This is the main process of transforming the raw result messages from a folder to a json file.
  """
  def raw_results_to_json(folder_name) do
    Path.wildcard("assets/#{folder_name}/*.txt")
    |> Enum.map(&File.read!/1)
    |> Enum.map(&ProcessRawChallengeDataResponse.get_message_from_raw_result!/1)
    |> Enum.filter(fn payload -> !is_list(payload["result"]) end)
    |> Enum.map(fn payload -> payload["result"] end)
    |> ProcessRawChallengeDataResponse.write_payload_to_json_file(
      "assets/#{folder_name}/#{folder_name}_challenges_data_details.json"
    )
  end
end
