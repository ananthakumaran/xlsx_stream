defmodule XlsxStream.ContentType do
  alias XmlStream, as: X
  alias XlsxStream.Schema

  def document(entries) do
    [
      X.declaration(),
      X.element("Types", %{xmlns: Schema.content_types()}, entries)
    ]
  end

  def default(attrs) do
    X.empty_element("Default", attrs)
  end

  def override(attrs) do
    X.empty_element("Override", attrs)
  end
end
