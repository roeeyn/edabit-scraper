defmodule EchoClient do
  use WebSockex
  require Logger

  @echo_server "ws://localhost:8080"
  def start_link(opts \\ []) do
    WebSockex.start_link(@echo_server, __MODULE__, %{}, opts)
  end

  def handle_frame({:text, msg}, state) do
    Logger.info("Echo server says: #{msg}")
    {:ok, state}
    # {:close, state}
    # {:reply, state}
  end

  def handle_disconnect(%{reason: reason}, state) do
    Logger.info("Disconnected with reason: #{inspect reason}")
    {:ok, state}
  end
end
