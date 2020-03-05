defmodule ElixirEssentialsPractice.Math.Area do
  def area({:rectangle, a, b}) do
    a*b
  end
  def area({:circle, r}) do
    3.14 * r * r
  end

  def kind(n) when is_number(n) and n > 0, do: :positive
  def kind(n) when is_number(n) and n < 0, do: :negative
  def kind(0), do: :zero
end
