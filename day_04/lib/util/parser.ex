defmodule Util.Reader do

  def read_from_file(filepath) do
    elem(File.read(filepath), 1)
      |> read_block
      |> read_document
  end

  def read_block(file_content) do
    matches = Regex.scan(~r/((\w{3}:.{1,})+\n?)+/, file_content)
    Enum.map(matches, fn [h|_] -> String.replace(h, "\n", " ") |> String.trim end)
  end

  def read_document(documents) do
    Enum.map(documents, fn document ->
      Enum.reduce(String.split(document, " "), %{}, fn x, acc -> [k, v] = String.split(x, ":"); Map.put(acc, String.to_atom(k), v) end)
    end)

  end


end
