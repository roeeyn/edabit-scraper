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

  def insert_one(%Challenge{} = todo) do
    with map <- dump(todo),
         {:ok, _} <- Mongo.insert_one(:mongo, @collection, map) do
      :ok
    end
  end
end
