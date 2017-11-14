defmodule XlsxStream.Workbook do
  alias XmlStream, as: X
  alias XlsxStream.Schema

  def document(sheets) do
    [
      X.declaration(),
      X.element(
        "workbook",
        %{xmlns: Schema.spreedsheetml(), "xmlns:r": Schema.relationships()},
        X.element("sheets", sheets)
      )
    ]
  end

  def sheet(attrs) do
    X.empty_element("sheet", attrs)
  end
end
