defmodule Util.Reader do
  def read_from_file(filepath) do
  elem(File.read(filepath), 1)
    |> String.split("\n\n")
  end
end
