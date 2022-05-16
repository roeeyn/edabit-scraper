defmodule UploadChallengesToMongo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  import Supervisor.Spec
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: UploadChallengesToMongo.Worker.start_link(arg)
      # {UploadChallengesToMongo.Worker, arg}
      worker(Challenges.Repo, [])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UploadChallengesToMongo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
