defmodule ElixirEssentialsPractice.Worker do

  alias ElixirEssentialsPractice.Factorial

  def job(a,b) do
    receive do
      {:compute, caller, n} ->
        result = Factorial.of(n)
        send caller, {:result, result}
        job(a+1,b)
      :status ->
        IO.puts "#{a} times"
        job(a,b)
      :die ->
          IO.puts("bye")
        _ ->
          IO.puts("invalid")
          job(a,b)
    end
  end
end
