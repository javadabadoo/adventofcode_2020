defmodule Day04 do
  def first do
    valid_passports = "./test/passports.txt"
      |> Util.Reader.read_from_file
      |> Util.Validator.has_required_fields([:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid])
      |> Util.Validator.count_valid_documents
    "We have #{valid_passports} valid Passports!"
  end
end
