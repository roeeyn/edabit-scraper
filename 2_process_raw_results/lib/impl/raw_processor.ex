defmodule ProcessRawResult.Impl.RawProcessor do
  def get_payload_from_result(result_file_path) do
    with {:ok, readed_file} <- File.read(result_file_path),
         {:ok, decoded_raw_file} <- Jason.decode(readed_file),
         temp <- String.slice(decoded_raw_file["payload"], 1..-1),
         {:ok, message_list} = Jason.decode(temp),
         [message | _] <- message_list,
         {:ok, result_list} <- Jason.decode(message) do
      {:ok, result_list["result"]}
    else
      {:error, "Failed to parse raw websockets message result"}
    end
  end
end
