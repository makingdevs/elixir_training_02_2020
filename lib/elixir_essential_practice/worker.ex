defmodule ElixirEssentialsPractice.Worker do

  def job(a,b) do
    receive do
      :display -> IO.puts("#{a} - #{b}")
      _ -> IO.puts("bye")
    end
    job(a,b)
  end
end
