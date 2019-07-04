defmodule Todo.Server do
  @moduledoc false

  use GenServer

  def start() do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end


  @impl GenServer
  def init(_opts) do
    cleanup()
    {:ok, Todo.List.new()}
  end


  def put(pid, todo) do
    GenServer.call(pid, {:put, todo})
  end
  def get_all(pid) do
    GenServer.call(pid, {:get_all})
  end


  @impl GenServer
  def handle_call({:put, todo}, _from, state) do
    newState = Todo.List.insert(state, todo)
    {:reply, :ok, newState}
  end

  @impl GenServer
  def handle_call({:get_all}, _from, state) do
    {:reply, state.entries, state}
  end

  @impl GenServer
  def handle_cast(_msg, state) do
    {:noreply, state}
  end

  @impl GenServer
  def handle_info(:cleanup, state) do
    IO.puts "Cleaning Up"
    {:noreply, state}
  end

  defp cleanup() do
    :timer.send_interval(5000, :cleanup)
  end
end
