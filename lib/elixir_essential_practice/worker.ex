defmodule ElixirEssentialsPractice.Worker do

  alias ElixirEssentialsPractice.Factorial

  def factorial_in_process(n) do
    spawn_process(self(), n)
    |> await()
  end

  defp spawn_process(caller, n) do
    spawn fn ->
      send caller, {self(), :result, Factorial.of(n)}
    end
  end

  def await(pid) do
    receive do
      {^pid, :result, result} -> result
    end
  end

  def job(a,b) do
    receive do
      {:compute, caller, n} ->
        result = Factorial.of(n)
        send caller, {:result, result}
        job(a+1,b)
      :status ->
        IO.puts "#{a} times"
        job(a,b)
      :error ->
        raise "Pelas"
      :die ->
          IO.puts("bye")
        _ ->
          IO.puts("invalid")
          job(a,b)
    end
  end
end
