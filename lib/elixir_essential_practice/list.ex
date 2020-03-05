defmodule ElixirEssentialsPractice.List do

  def size(lista), do: count(lista, 0)
  defp count([], n), do: n
  defp count([_ | t], n), do: count(t, n + 1)

  def sum(lista), do: do_sum(lista, 0)
  defp do_sum([], accum), do: accum
  defp do_sum([h | t], accum), do: do_sum(t, accum + h)

  def to(n), do: create_list([], n, 0)
  defp create_list(list, 0, _), do: list
  defp create_list(list, n, e), do: create_list(list ++ [e+1], n-1, e+1)

  def to2(n), do: create_list_2([], n)
  defp create_list_2(list, 0), do: list
  defp create_list_2(list, n), do: create_list_2([n | list], n-1)

  def fizzbuzz(lista), do: fizzbuzz_calculate(lista, [])

  defp fizzbuzz_calculate([], lista), do: lista
  defp fizzbuzz_calculate([h|t], lista), do: fizzbuzz_calculate(t, lista ++ [what_is_2(h)])
  defp what_is(h) do
    remainder_for({rem(h,3), rem(h,5), h})
  end
  defp remainder_for({0,0,_}), do: :fizzbuzz
  defp remainder_for({0,_,_}), do: :fizz
  defp remainder_for({_,0,_}), do: :buzz
  defp remainder_for({_,_,h}), do: h


  defp what_is_2(h), do: remainder2_for({h,h,h})
  defp remainder2_for({f,b,_}) when rem(f,3) == 0 and rem(b,5) == 0, do: :fizzbuzz
  defp remainder2_for({f,_,_}) when rem(f,3) == 0, do: :fizz
  defp remainder2_for({_,b,_}) when rem(b,5) == 0, do: :buzz
  defp remainder2_for({_,_,h}), do: h

  # FizzBuzz
  # 3 => Fizz
  # 5 => Buzz
  # 3 & 5 => FizzBuzz

end

