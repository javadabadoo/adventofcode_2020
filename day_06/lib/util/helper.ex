defmodule Util.Helper do

  def clean_lines([h|t], acc) do
    clean_line = h
      |> String.replace("\n", "")
      |> String.graphemes
      |> Enum.uniq
    clean_lines(t, [clean_line|acc])
  end

  def clean_lines([], acc), do: Enum.reverse(acc)

  def count_unique_answers(answers) do
    answers
      |> List.flatten()
      |> Enum.count()
  end

  def extract_common_answer([group_responses|t], common_answers) do
    extract_common_answer(t, [get_common_answers(Enum.to_list(?a..?z), group_responses, [])| common_answers])
  end

  def extract_common_answer([], common_answers), do: common_answers

  def get_common_answers([current_letter|t], group_responses, common_answers) do
    if has_all_yes_anwers(current_letter, group_responses) do
      get_common_answers(t, group_responses, [<< current_letter :: utf8>> | common_answers])
    else
      get_common_answers(t, group_responses, common_answers)
    end
  end

  def get_common_answers([], _, common_answers), do: common_answers

  def has_all_yes_anwers(letter, group_responses) do
    {total_responses, cleaned_responses} = join_responses(group_responses)
    Regex.scan(~r/#{<<letter :: utf8>>}/, cleaned_responses)
    |> Enum.count() == total_responses
  end

  def join_responses(responses) do
    {
      Regex.scan(~r/\n./, responses) |> Enum.count() |> Kernel.+(1),
      String.replace(responses, "\n", "")
    }
  end

  ?a..?z
end
