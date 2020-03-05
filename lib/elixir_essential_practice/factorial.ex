defmodule ElixirEssentialsPractice.Factorial do
  def of(1), do: 1
  def of(n), do: n * of(n-1)

  def of_no_stack(n), do: of_no_stack(n, 1)
  def of_no_stack(1, state), do: state
  def of_no_stack(n, state), do: of_no_stack(n-1, state * n)
end
