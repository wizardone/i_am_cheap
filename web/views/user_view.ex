defmodule IAmCheap.UserView do
  use IAmCheap.Web, :view

  def changeset_error_string(changeset) do
    Enum.map(changeset.errors, fn({key, value}) ->
      "#{Phoenix.Naming.humanize(key)} #{translate_error(value)}"
    end) |> Enum.join("\n")
  end
end
