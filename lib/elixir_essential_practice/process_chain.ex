defmodule ElixirEssentialsPractice.ProcessChain do

  def chain do
    receive do
      {:continue, 0} ->
        IO.puts "Process 0 Stop"
        :stop
      {:continue, n} ->
        IO.puts "Process #{n} in #{inspect self()}"
        :timer.sleep 1000
        pid = spawn_link(__MODULE__, :chain, [])
        send pid, {:continue, n - 1}
      _ -> :stop
    end
    chain()
  end

  def start() do
    pid = spawn_link __MODULE__, :chain, []
    send pid, {:continue, 10}
    {:ok, pid}
  end
end
