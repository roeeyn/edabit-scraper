defmodule UploadChallengesToMongo.MixProject do
  use Mix.Project

  def project do
    [
      app: :upload_challenges_to_mongo,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {UploadChallengesToMongo.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mongodb_ecto, "~> 0.2"},
    ]
  end
end
