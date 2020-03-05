defmodule ElixirEssentialsPractice.AdventOfCode do
  @moduledoc "Este es el módulo que agrupa las implementaciones de soluciones de Advent  of code"

  @doc "Esta es la solución para día 1 año 2015"
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

  def santa_deliver_gifts_in_grid(instructions) do
    instructions
    |> String.split("")
    |> follow_instructions_in_grid([{0,0}], {0,0})
  end

  defp follow_instructions_in_grid([], grid, _current), do: grid
  defp follow_instructions_in_grid([h|t], grid, current) do
    movement = evaluate_the_instruction(h)
    new_location = move_santa(current, movement)
    new_grid = grid ++ [new_location]
    follow_instructions_in_grid(t, new_grid, new_location)
  end

  defp evaluate_the_instruction("^"), do: {0, 1}
  defp evaluate_the_instruction("<"), do: {-1, 0}
  defp evaluate_the_instruction(">"), do: {1, 0}
  defp evaluate_the_instruction("v"), do: {0, -1}
  defp evaluate_the_instruction(_), do: {0, 0}

  defp move_santa({x1,y1}, {x2, y2}), do: {x1+x2, y1+y2}

end

