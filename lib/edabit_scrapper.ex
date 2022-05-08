defmodule EdabitScrapper do
  @moduledoc """
  Documentation for `EdabitScrapper`.
  """
  alias EdabitScrapper.Impl.WsScrapper

  @doc """
  Hello world.

  ## Examples

      iex> EdabitScrapper.hello()
      :world

  """
  def hello do
    :world
  end

  defdelegate create(), to: WsScrapper, as: :start_link

  defdelegate send_demo(pid), to: WsScrapper, as: :send_demo
end
