defmodule Docker.Parser do
  def parse(data) do
    data
    |> entities
    |> Enum.map(fn(entity) ->
      parse_entity(entity)
    end)
  end

  def entities(data) do
    data
    |> String.split("\n\n")
    |> Enum.filter(fn(s) -> s != "" end)
  end

  def parse_entity(raw_entity) do
    raw_entity
    |> String.split("\n")
    |> Enum.map(fn(field) -> parse_field(field) end)
    |> Enum.into(%{})
  end

  def parse_field(raw_field) do
    [key, value] =
      if String.match?(raw_field, ~r/.+: .+/) do
        raw_field |> String.split(": ", parts: 2)
      else
        raw_field |> String.split(":", parts: 2)
      end

    {key |> String.downcase |> String.to_atom, value}
  end
end
