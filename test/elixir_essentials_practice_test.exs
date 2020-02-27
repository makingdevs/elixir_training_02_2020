defmodule ElixirEssentialsPracticeTest do
  use ExUnit.Case
  doctest ElixirEssentialsPractice

  test "greets the world" do
    assert ElixirEssentialsPractice.hello() == :world
  end
end
