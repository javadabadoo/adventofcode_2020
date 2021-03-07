defmodule Util.Decoder do

  def decode_list(code_list) do
    Enum.map(code_list, fn code -> decode(code) end)
  end

  def decode(code) do
    row.._ = Enum.reduce(String.graphemes(String.slice(code, 0..-4)), 0..127, fn position, range -> get_range_by_position(range, position) end)
    column.._ = Enum.reduce(String.graphemes(String.slice(code, -3..-1)), 0..7, fn position, range -> get_range_by_position(range, position) end)
    id = row * 8 + column
    [row: row, column: column, id: id]
  end

  def get_range_by_position(first..last, position) do
    cond do
      String.match?(position, ~r/F|L/) ->
        first..last - round((last - first + 1) / 2)
      String.match?(position, ~r/B|R/) ->
        first + round((last - first + 1) / 2)..last
    end
  end

  def find_empty_seat(ordered_rows) do
    Enum.reduce_while(ordered_rows, List.first(ordered_rows)[:id], fn row, next_id ->
      case row[:id] == next_id do true -> {:cont, row[:id] + 1}; _ -> {:halt, row[:id] - 1} end
    end)
  end
end
