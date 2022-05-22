import Config

# TODO: replace with your own values
config :mongo_challenges_uploader, MongoChallengesUploader.Repo,
  url: "mongodb://localhost:27017",
  timeout: 60_000,
  database: "my_local_db",
  idle_interval: 10_000,
  queue_target: 5_000,
  pool_size: 3,
  # This should be enabled only in a dev environment
  show_sensitive_data_on_connection_error: true,
  username: "root",
  password: "root",
  auth_source: "admin"
