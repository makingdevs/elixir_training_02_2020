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

  def gcd(a,a), do: a
  def gcd(a,b) when a > b, do: gcd(a-b, b)
  def gcd(a,b) when b > a, do: gcd(a, b-a)
end
