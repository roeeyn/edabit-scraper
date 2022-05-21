defmodule MongoChallengesUploader.Impl.EdabitChallenge do
  alias MongoChallengesUploader.Impl.EdabitChallenge

  # This is the struct that match the JSON output from previous steps
  @enforce_keys [
    :_id,
    :author,
    :author_id,
    :code,
    :difficulty,
    :instructions,
    :lab,
    :language,
    :quality,
    :summary,
    :tags,
    :title
  ]
  defstruct [
    :_id,
    :author,
    :author_id,
    :code,
    :difficulty,
    :instructions,
    :lab,
    :language,
    :quality,
    :summary,
    :tags,
    :title
  ]

  def create_from_map(decoded_map) do
    %EdabitChallenge{
      _id: decoded_map["_id"],
      author: decoded_map["author"],
      author_id: decoded_map["authorId"],
      code: decoded_map["code"],
      difficulty: decoded_map["difficulty"],
      instructions: decoded_map["instructions"],
      lab: decoded_map["lab"],
      language: decoded_map["language"],
      quality: decoded_map["quality"],
      summary: decoded_map["summary"],
      tags: decoded_map["tags"],
      title: decoded_map["title"]
    }
  end
end
