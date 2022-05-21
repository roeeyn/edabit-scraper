defmodule MongoChallengesUploader.Impl.Challenge do
  use Mongo.Collection

  alias MongoChallengesUploader.Impl.Challenge

  # only to suppress warnings
  @collection nil

  collection "challenges" do
    attribute(:edabit_id, String.t())
    attribute(:author, String.t())
    attribute(:author_edabit_id, String.t())
    attribute(:raw_code, String.t())
    attribute(:difficulty, String.t())
    attribute(:raw_instructions, String.t())
    attribute(:raw_tests, String.t())
    attribute(:programming_language, String.t())
    attribute(:quality, String.t())
    attribute(:summary, String.t())
    attribute(:tags, list(String.t()))
    attribute(:title, String.t())
  end

  def create_from_edabit_challenge(edabit_challenge) do
    Challenge.new()
    |> Map.put(:edabit_id, edabit_challenge._id)
    |> Map.put(:author, edabit_challenge.author)
    |> Map.put(:author_edabit_id, edabit_challenge.author_id)
    |> Map.put(:raw_code, edabit_challenge.code)
    |> Map.put(:difficulty, edabit_challenge.difficulty)
    |> Map.put(:raw_instructions, edabit_challenge.instructions)
    |> Map.put(:raw_tests, edabit_challenge.lab)
    |> Map.put(:programming_language, edabit_challenge.language)
    |> Map.put(:quality, edabit_challenge.quality)
    |> Map.put(:summary, edabit_challenge.summary)
    |> Map.put(:tags, edabit_challenge.tags)
    |> Map.put(:title, edabit_challenge.title)
  end

  def insert_one(%Challenge{} = todo) do
    with map <- dump(todo),
         {:ok, _} <- Mongo.insert_one(:mongo, @collection, map) do
      :ok
    end
  end
end
