defmodule ElixirEssentialsPractice.Worker do

  alias ElixirEssentialsPractice.Factorial

  def many_factorials(list_of_numbers) when is_list(list_of_numbers) do
    list_of_numbers
    |> Enum.map(&(spawn_process(self(), &1)))
    |> Enum.map(&await/1)
  end

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
