defmodule EdabitScrapperTest do
  use ExUnit.Case
  doctest EdabitScrapper

  test "greets the world" do
    assert EdabitScrapper.hello() == :world
  end
end
