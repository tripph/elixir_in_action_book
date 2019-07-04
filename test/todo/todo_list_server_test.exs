defmodule Todo.ServerTest do
  use ExUnit.Case

  alias Todo.Server

  @moduletag :capture_log

  doctest Todo.Server

  test "module exists" do
    assert is_list(Todo.Server.module_info())
  end

  test "can add an item to a list" do
    {:ok, pid} = Todo.Server.start()
    item = %Todo.Item{title: "Go Home"}
    :ok = Todo.Server.put(pid, item)
    list = Todo.Server.get_all(pid)
    assert Map.has_key?(list,1)
  end
end
