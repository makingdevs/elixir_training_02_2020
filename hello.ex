defmodule Hello do
  def greet(name) do
    "Hello #{name}"
  end
end

IO.puts Hello.greet("MakingDevs")
