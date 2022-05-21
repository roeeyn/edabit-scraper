defmodule MongoChallengesUploader.Impl.Uploader do
  alias MongoChallengesUploader.Impl.Challenge
  alias MongoChallengesUploader.Impl.EdabitChallenge

  defp decode_challenges_from_file(file_path) do
    with {:ok, readed_file} <- File.read(file_path) do
      Jason.decode(readed_file)
    else
      _ -> {:error, "Failed to read and decode file"}
    end
  end

  def upload_challenges_from_asset(folder_name) do
    load_challenges_from_asset(folder_name)
    |> upload_challenges()
  end

  def load_challenges_from_asset(folder_name) do
    {:ok, decoded_challenges} = decode_challenges_from_file(folder_name)

    decoded_challenges
    |> Enum.map(&EdabitChallenge.create_from_map/1)
    |> Enum.map(&Challenge.create_from_edabit_challenge/1)
  end

  def upload_challenges(challenges) do
    result =
      challenges
      |> Enum.map(&Challenge.insert_one/1)
      |> Enum.all?(fn result -> result == :ok end)

    with true <- result do
      {:ok, "Successfully uploaded challenges"}
    else
      _ -> {:error, "Failed to upload challenges"}
    end
  end
end
