defmodule ElixirEssentialsPractice.Hello do
  def greet(), do: say() <> " You !!!"
  def greet(name), do: "Hello #{name} !!!"
  def greet(name1, name2), do: "Hello #{name1} and #{name2} !!!"
  defp say(), do: "howdy"

  def display([]), do: IO.puts "Empty"
  def display([h | []]), do: IO.puts "Solo uno #{h}"
  def display([h | t]), do: IO.puts "#{h} y #{t}"
end
