defmodule TodoListServerTest do
  use ExUnit.Case

  alias TodoList

  @moduletag :capture_log

  doctest TodoList

  test "module exists" do
    assert is_list(TodoListServer.module_info())
  end

  test "can add an item to a list" do
    {:ok, pid} = TodoListServer.start()
    item = %TodoItem{title: "Go Home"}
    :ok = TodoListServer.put(pid, item)
    list = TodoListServer.get_all(pid)
    assert Map.has_key?(list,1)
  end
end
