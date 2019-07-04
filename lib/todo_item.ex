defmodule TodoItem do
  @moduledoc false
  defstruct id: 0, title: "", completed: false, date_created: NaiveDateTime.utc_now, date_completed: nil
end

defmodule TodoList do
  defstruct auto_id: 1, entries: %{}
  def new(), do: %TodoList{}

  def insert(list, entry) do
    entry = %{entry | id: list.auto_id}
    %{
      list |
      entries: Map.put(list.entries, list.auto_id, entry),
      auto_id: list.auto_id + 1
    }
  end
end
