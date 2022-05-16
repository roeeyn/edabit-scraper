use Mix.Config

config :upload_challenges_to_mongo, Challenges.Repo,
  adapter: Mongo.Ecto,
  database: "upload_challenges_to_mongo_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

config :upload_challenges_to_mongo, ecto_repos: [Challenges.Repo]
