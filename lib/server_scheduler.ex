defmodule ServerScheduler do
  use GenServer

  def create(initial_state \\ 0) do
    cond do
      initial_state < 0 -> {:error, "value can't be negative"}
      true -> GenServer.start_link(__MODULE__, initial_state)
    end
  end

  def init(state), do: {:ok, state}

  def read(pid) do
    GenServer.call(pid, :read)
  end

  def aument(pid, amount) do
    GenServer.call(pid, {:aument, amount})
  end

  def terminate(pid) do
    Process.exit(pid, :shutdown)
  end

  def handle_call(:read, _from_id, state) do
    {:reply, state, state}
  end

  def handle_call({:aument, amount}, _from_id, state) do
    state = state + amount
    {:reply, state, state}
  end

end


#{:ok, pid} = ServerScheduler.create(1000)
#ServerScheduler.aument(pid, 100)
#IO.puts(ServerScheduler.read(pid))
#IO.puts(ServerScheduler.terminate(pid))