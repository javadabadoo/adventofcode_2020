defmodule Day06 do
  def first do
    unique_answer_sum = "./test/input.txt"
      |> Util.Reader.read_from_file()
      |> Util.Helper.clean_lines([])
      |> Util.Helper.count_unique_answers()

    "Sum of all grups unique anwers is #{unique_answer_sum}"
  end

  def second do
    unique_answer_sum = "./test/input.txt"
      |> Util.Reader.read_from_file()
      |> Util.Helper.extract_common_answer([])
      |> Util.Helper.count_unique_answers()

    "Sum of all commons answers is #{inspect unique_answer_sum}"
  end
end
