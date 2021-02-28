defmodule Util.Validator do
  def has_required_fields(documents_map, required_fields) do
    Enum.map(documents_map, fn document_map ->
      Enum.reduce(required_fields, true, fn required_field, is_valid -> is_valid = is_valid && document_map[required_field] != nil end)
    end)
  end

  def count_valid_documents(validation_result) do
    Enum.count(validation_result, fn x -> x == true end)
  end
end
