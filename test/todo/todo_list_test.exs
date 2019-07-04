defmodule Todo.ListTest do
  use ExUnit.Case

  @moduletag :capture_log

  doctest Todo.List

  test "module exists" do
    assert is_list(Todo.List.module_info())
  end

  test "can create new list" do
    Todo.List.new()
  end

  test "can add an item to a list" do
    list = Todo.List.new()
    item = %Todo.Item{title: "Go Home"}
    Todo.List.insert(list, item)
  end
end
