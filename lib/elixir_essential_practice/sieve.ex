defmodule ElixirEssentialsPractice.Sieve do
  def primes_to(n) do
    sieve([], candidates(n))
  end

  defp sieve(primes, []) do
    primes
  end

  defp sieve(primes, [h | t]) do
    sieve(primes ++ [h], reject_numbers(h, t))
  end

  def candidates(n) do
    Enum.into 2..n, []
  end

  def reject_numbers(factor, numbers) do
    Enum.reject numbers, fn x -> rem(x,factor) == 0 end
  end
end
