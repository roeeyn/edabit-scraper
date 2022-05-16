defmodule UploadChallengesToMongo do
  @moduledoc """
  Documentation for `UploadChallengesToMongo`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> UploadChallengesToMongo.hello()
      :world

  """

  import Ecto.Query

  def sample_query do
    query =
      from w in Challenges,
        where: w.prcp > 0.0 or is_nil(w.prcp),
        select: w

    Challenges.Repo.all(query)
  end

  def sample_insert do
    %Challenges{}
    |> Ecto.Changeset.change(%{})
    |> Challenges.Repo.insert()
  end

  def sample_update do
    {:ok, weather} = sample_insert()

    weather
    |> Ecto.Changeset.change(%{city: "NYC"})
    |> Challenges.Repo.update()
  end

  def hello do
    :world
  end
end
