defmodule ProcessRawChallengeDataResponse.Impl.RawProcessor do
  def get_message_from_raw_result(raw_result) do
    with temp <- String.slice(raw_result, 1..-1),
         {:ok, payload_list} <- Jason.decode(temp),
         raw_payload <- Enum.at(payload_list, 0),
         {:ok, payload} <- Jason.decode(raw_payload) do
      {:ok, payload}
    else
      _ -> {:error, "Failed to parse raw result"}
    end
  end

  def get_message_from_raw_result!(raw_result) do
    with temp <- String.slice(raw_result, 1..-1),
         {:ok, payload_list} <- Jason.decode(temp),
         raw_payload <- Enum.at(payload_list, 0),
         {:ok, payload} <- Jason.decode(raw_payload) do
      payload
    end
  end

  def write_payload_to_json_file(processed_payload) do
    {:ok, encoded_payload} = Jason.encode(processed_payload)
    formatted_file = Jason.Formatter.pretty_print(encoded_payload)
    File.write("processed_result.json", formatted_file, [:binary])
  end

  def write_payload_to_json_file(processed_payload, output_file) do
    {:ok, encoded_payload} = Jason.encode(processed_payload)
    formatted_file = Jason.Formatter.pretty_print(encoded_payload)
    File.write(output_file, formatted_file, [:binary])
  end
end
