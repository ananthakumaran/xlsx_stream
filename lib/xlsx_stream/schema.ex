defmodule XlsxStream.Schema do
  def package_relationships, do: "http://schemas.openxmlformats.org/package/2006/relationships"

  def relationships, do: "http://schemas.openxmlformats.org/officeDocument/2006/relationships"
  def relationships(type), do: "http://schemas.openxmlformats.org/officeDocument/2006/relationships/" <> type

  def content_types, do: "http://schemas.openxmlformats.org/package/2006/content-types"

  def extended_properties, do: "http://schemas.openxmlformats.org/officeDocument/2006/extended-properties"
  def doc_props_v_types, do: "http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes"

  def metadata(type), do: "http://schemas.openxmlformats.org/package/2006/metadata/" <> type

  def spreedsheetml, do: "http://schemas.openxmlformats.org/spreadsheetml/2006/main"
end
