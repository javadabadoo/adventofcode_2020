defmodule Util.Helper do

  def clean_lines([h|t], acc) do
    clean_line = h
      |> String.replace("\n", "")
      |> String.graphemes
      |> Enum.uniq
    clean_lines(t, [clean_line|acc])
  end

  def clean_lines([], acc), do: Enum.reverse(acc)

  def count_unique_answers([h|t], counter) do
    count_unique_answers(t, counter + Enum.count(h))
  end

  def count_unique_answers([], counter), do: counter
end
