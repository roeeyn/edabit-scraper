defmodule EdabitScrapper.Impl.WsScrapper do
  use WebSockex
  require Logger

  # @echo_server "ws://localhost:8080"
  @echo_server "wss://edabit.com/sockjs/909/2o6pbi1g/websocket"

  def start_link(opts \\ []) do
    {:ok, pid} = WebSockex.start_link(@echo_server, __MODULE__, %{}, opts)
    send_demo(pid)
    {:ok, pid} 
  end

  def send_demo(pid) do
  message_list = [
  """
    ["{\"msg\":\"connect\",\"version\":\"1\",\"support\":[\"1\",\"pre2\",\"pre1\"]}"]
  """,

  """
    ["{\"msg\":\"method\",\"method\":\"login\",\"params\":[{\"resume\":\"QYb-2gFQBhCSHZIrLulUfH7avPdnwaQYxoMABbiL5NT\"}],\"id\":\"1\"}"]
  """,

  """
    ["{\"msg\":\"sub\",\"id\":\"5izzKraozCGCWCYjS\",\"name\":\"meteor.loginServiceConfiguration\",\"params\":[]}"]
  """,

  """
    ["{\"msg\":\"sub\",\"id\":\"8pzxr37j9KnZreivt\",\"name\":\"meteor_autoupdate_clientVersions\",\"params\":[]}"]
  """,

  """
    ["{\"msg\":\"sub\",\"id\":\"WRj3AxhzCFaqfYLEE\",\"name\":\"notifications.user\",\"params\":[]}"]
  """,

  """
    ["{\"msg\":\"sub\",\"id\":\"BtJWqz8QckL3fusST\",\"name\":\"user\",\"params\":[]}"]
  """,
  ]

  Enum.map(message_list, fn message -> WebSockex.send_frame(pid, message) end)

  json = """
    ["{\"msg\":\"ping\"}"]
  """
  WebSockex.send_frame(pid, {:text, json})

  end

  def handle_frame({:text, msg}, state) do
    Logger.info("Echo server says: #{msg}")
    Logger.info("State: #{inspect state}")
    {:ok, state}
    # {:close, state}
    # {:reply, state}
  end

  def handle_disconnect(%{reason: reason}, state) do
    Logger.info("Disconnected with reason: #{inspect reason}")
    {:ok, state}
  end
end
