defmodule XlsxStream.Relationship do
  alias XmlStream, as: X
  alias XlsxStream.Schema

  def document(relationships) do
    [
      X.declaration(),
      X.element("Relationships", %{xmlns: Schema.package_relationships()}, relationships)
    ]
  end

  def relationship(attrs) do
    X.empty_element("Relationship", attrs)
  end
end
