defmodule Day05 do

  def first do
    max_id_row = "./test/codes.txt"
      |> Util.Reader.read_from_file
      |> Util.Decoder.decode_list()
      |> Enum.max_by(fn row -> row[:id] end)

      "#{max_id_row[:id]} is the highest ID found and it's located at Row: #{max_id_row[:row]} and Column: #{max_id_row[:column]}"
  end
end
