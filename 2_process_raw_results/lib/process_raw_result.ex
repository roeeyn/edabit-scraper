defmodule ProcessRawResult do
  @moduledoc """
  Documentation for `ProcessRawResult`.
  """
  alias ProcessRawResult.Impl.RawProcessor

  defdelegate get_payload_from_result(result_file_path), to: RawProcessor

  @doc """
  Hello world.

  ## Examples

      iex> ProcessRawResult.hello()
      :world

  """
  def hello do
    :world
  end
end
