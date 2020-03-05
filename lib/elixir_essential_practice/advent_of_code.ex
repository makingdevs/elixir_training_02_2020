defmodule ElixirEssentialsPractice.AdventOfCode do
  def santa_deliver_gifts(instructions) do
    instructions
    |> String.split("")
    |> follow_instructions(0)
  end

  defp follow_instructions([], floor), do: floor
  defp follow_instructions([h|t], floor) do
    follow_instructions(t, floor + execute_instruction(h))
  end

  defp execute_instruction("("), do:  1
  defp execute_instruction(")"), do: -1
  defp execute_instruction(_),   do:  0

end

