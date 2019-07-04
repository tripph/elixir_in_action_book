defmodule TodoListTest do
  use ExUnit.Case

  alias TodoList

  @moduletag :capture_log

  doctest TodoList

  test "module exists" do
    assert is_list(TodoList.module_info())
  end
  test "can create new list" do
    TodoList.new()
  end
  test "can add an item to a list" do
    list = TodoList.new()
    item = %TodoItem{title: "Go Home"}
    TodoList.insert(list, item)
  end
end
