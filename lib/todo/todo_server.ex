defmodule Todo.Server do
  @moduledoc false

  use GenServer

  def start(name) do
    GenServer.start(__MODULE__, name)
  end

  @impl GenServer
  def init(name) do
    send(self(), {:real_init, name})
    {:ok, nil}
  end

  def handle_info({:real_init, name}, state) do
    {:noreply, {name, Todo.Database.get(name) || Todo.List.new()}}
  end

  def put(pid, todo) do
    GenServer.call(pid, {:put, todo})
  end

  def get_all(pid) do
    GenServer.call(pid, {:get_all})
  end

  @impl GenServer
  def handle_call({:put, todo}, _from, {name, todo_list}) do
    new_list = Todo.List.insert(todo_list, todo)
    Todo.Database.store(name, new_list)
    {:reply, :ok, {name, new_list}}
  end

  @impl GenServer
  def handle_call({:get_all}, _from, {name, todo_list}) do
    {:reply, todo_list.entries, {name, todo_list}}
  end

  @impl GenServer
  def handle_cast(_msg, state) do
    {:noreply, state}
  end

  @impl GenServer
  def handle_info(:cleanup, state) do
    IO.puts("Cleaning Up")
    {:noreply, state}
  end
  #
  #  defp cleanup() do
  #    :timer.send_interval(5000, :cleanup)
  #  end
end
