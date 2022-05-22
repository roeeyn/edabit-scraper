defmodule ProcessRawResult.Impl.RawProcessor do
  def get_payload_from_raw_result(readed_file) do
    with {:ok, decoded_raw_file} <- Jason.decode(readed_file),
         temp <- String.slice(decoded_raw_file["payload"], 1..-1),
         {:ok, message_list} = Jason.decode(temp),
         [message | _] <- message_list,
         {:ok, result_list} <- Jason.decode(message) do
      {:ok, result_list["result"]}
    else
      _ -> {:error, "Failed to parse raw websockets message result"}
    end
  end

  def get_payload_from_raw_result!(readed_file) do
    with {:ok, decoded_raw_file} <- Jason.decode(readed_file),
         temp <- String.slice(decoded_raw_file["payload"], 1..-1),
         {:ok, message_list} = Jason.decode(temp),
         [message | _] <- message_list,
         {:ok, result_list} <- Jason.decode(message) do
      result_list["result"]
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
