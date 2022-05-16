defmodule Challenges.Repo do
  use Ecto.Repo,
  otp_app: :upload_challenges_to_mongo,
  adapter: Mongo.Ecto
end
