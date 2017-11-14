defmodule XlsxStream.Relationships do
  alias XmlStream, as: X
  alias XlsxStream.Schema

  def build(relationships) do
    [
      X.declaration(),
      X.element("Relationships", %{xmlns: Schema.package_relationships()}, relationships)
    ]
  end
end
