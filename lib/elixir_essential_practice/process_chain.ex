defmodule ElixirEssentialsPractice.ProcessChain do

  def chain do
    receive do
      {:continue, 0, caller} ->
        IO.puts "Process 0 in #{inspect self()} from #{inspect caller}"
        :stop
      {:continue, n, caller} ->
        IO.puts "Process #{n} in #{inspect self()} from #{inspect caller}"
        :timer.sleep 1000
        pid = spawn_link(__MODULE__, :chain, [])
        send pid, {:continue, n - 1, self()}
      _ -> :stop
    end
    chain()
  end

  def start(caller, chain_size \\ 10) when is_pid(caller) do
    pid = spawn_link __MODULE__, :chain, []
    send pid, {:continue, chain_size, caller}
    {:ok, pid}
  end
end
