defmodule ElixirEssentialsPractice.Math.Area do
  def area({:rectangle, a, b}) do
    a*b
  end
  def area({:circle, r}) do
    3.14 * r * r
  end
end
