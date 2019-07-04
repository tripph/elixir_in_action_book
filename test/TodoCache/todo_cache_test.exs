defmodule TodoCacheTest do
  use ExUnit.Case

  alias TodoCache

  @moduletag :capture_log

  doctest TodoCache

  test "module exists" do
    assert is_list(TodoCache.module_info())
  end

  test "can create 100,000 lists" do
    {:ok, cache} = TodoCache.start()
    Enum.each(
      1..100_000,
      fn index ->
        TodoCache.server_process(cache, "todo list #{index}}")
      end
    )
    assert :erlang.system_info(:process_count) > 100_000
  end
end
