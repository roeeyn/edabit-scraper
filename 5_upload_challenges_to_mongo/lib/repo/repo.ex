defmodule MongoChallengesUploader.Repo do
  use Mongo.Repo,
    otp_app: :mongo_challenges_uploader,
    topology: :mongo
end
