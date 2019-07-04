defmodule ElixirInActionBookTest do
  use ExUnit.Case
  doctest ElixirInActionBook

  test "greets the world" do
    assert ElixirInActionBook.hello() == :world
  end
end
