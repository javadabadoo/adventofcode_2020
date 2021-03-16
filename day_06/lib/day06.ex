defmodule Day06 do
  def first do
    unique_answer_sum = "./test/input.txt"
      |> Util.Reader.read_from_file()
      |> Util.Helper.clean_lines([])
      |> Util.Helper.count_unique_answers(0)

    "Sum of all grups unique anwers is #{unique_answer_sum}"
  end
end
