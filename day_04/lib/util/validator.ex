defmodule Util.Validator do
  def has_required_fields(documents_map, required_fields) do
    Enum.map(documents_map, fn document_map ->
      Enum.reduce(required_fields, true, fn required_field, is_valid -> is_valid && document_map[required_field] != nil end)
    end)
  end

  def count_valid_documents(validation_result) do
    Enum.count(validation_result, fn x -> x == true end)
  end

  def validate_fields(documents_map) do
    Enum.map(documents_map, fn document_map ->
      Enum.reduce_while(get_rules(), true, fn {field, rule}, _ ->
        case document_map[field] != nil && rule.(document_map[field]) do true -> {:cont, true}; _ -> {:halt, false} end
      end)
    end)
  end

  def get_rules do
    [
      {:byr, fn(byr) -> {y,_} = Integer.parse(byr); Enum.member?(1920..2002, y) end},
      {:iyr, fn(iyr) -> {y,_} = Integer.parse(iyr); Enum.member?(2010..2020, y) end},
      {:eyr, fn(eyr) -> {y,_} = Integer.parse(eyr); Enum.member?(2020..2030, y) end},
      {:hgt, fn(hgt) -> Regex.run(~r/^(\d{1,}cm|\d{1,}in)$/, hgt) != nil end},
      {:hgt, fn(hgt) -> case Integer.parse(hgt) do
                          {h, "cm"} -> Enum.member?(150..193, h);
                          {h, "in"} -> Enum.member?(59..76, h);
                          _ -> false
                        end
                      end},
      {:hcl, fn(hcl) -> Regex.run(~r/^#[\da-f]{6}$/, hcl) != nil end},
      {:ecl, fn(ecl) -> Regex.run(~r/^(amb|blu|brn|gry|grn|hzl|oth)$/, ecl) != nil end},
      {:pid, fn(pid) -> Regex.run(~r/^\d{9}$/, pid) != nil end}
    ]
  end
end
