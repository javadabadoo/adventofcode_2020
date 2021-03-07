defmodule Util.Decoder do

  def decode([h|t], max_id_row) do
    decoded_row = decode(h)
    decode(t, case decoded_row[:id] > max_id_row[:id] do true -> decoded_row; _ -> max_id_row end)
  end

  def decode([], max_id_row), do: max_id_row

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
end
