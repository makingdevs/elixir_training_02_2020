defmodule ElixirEssentialsPractice.Worker do

  def job(a,b) do
    receive do
      :display ->
        IO.puts("#{a} - #{b}")
        job(a,b)
      :die ->
          IO.puts("bye")
        _ ->
          IO.puts("invalid")
          job(a,b)
    end
  end
end
