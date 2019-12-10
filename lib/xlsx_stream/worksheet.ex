defmodule XlsxStream.Worksheet do
  alias XmlStream, as: X
  alias XlsxStream.Schema
  alias XlsxStream.Utils

  def document(body) do
    [
      X.declaration(),
      X.element(
        "worksheet",
        %{
          xmlns: Schema.spreedsheetml(),
          "xmlns:r": Schema.relationships(),
          "xml:space": "preserve"
        },
        body
      )
    ]
  end

  def sheet_pr(body, attrs \\ %{}) do
    X.element("sheetPr", attrs, body)
  end

  def cols(body, attrs \\ %{}) do
    X.element("cols", attrs, body)
  end

  def sheet_data(body, attrs \\ %{}) do
    X.element("sheetData", attrs, body)
  end

  def sheet_views(body, attrs \\ %{}) do
    X.element("sheetViews", attrs, body)
  end

  def c(body, attrs \\ %{}) do
    X.element("c", attrs, body)
  end

  def is(body, attrs \\ %{}) do
    X.element("is", attrs, body)
  end

  def t(body, attrs \\ %{}) do
    X.element("t", attrs, body)
  end

  def v(body, attrs \\ %{}) do
    X.element("v", attrs, body)
  end

  def merge_cells(body, attrs \\ %{}) do
    Utils.counted("mergeCells", body, attrs)
  end

  def merge_cell(attrs) do
    X.empty_element("mergeCell", attrs)
  end

  def page_setup_pr(attrs), do: X.empty_element("pageSetUpPr", attrs)
  def dimension(attrs), do: X.empty_element("dimension", attrs)
  def sheet_view(attrs), do: X.empty_element("sheetView", attrs)
  def sheet_format_pr(attrs), do: X.empty_element("sheetFormatPr", attrs)
  def col(attrs), do: X.empty_element("col", attrs)
  def sheet_calc_pr(attrs), do: X.empty_element("sheetCalcPr", attrs)
  def print_options(attrs), do: X.empty_element("printOptions", attrs)
  def page_margins(attrs), do: X.empty_element("pageMargins", attrs)
  def page_setup(attrs), do: X.empty_element("pageSetup", attrs)
  def header_footer(attrs), do: X.empty_element("headerFooter", attrs)

  def row(items, mapper, row_index \\ 1) do
    identifier = to_string(row_index)
    {[X.element("row", %{r: identifier}, cells(items, identifier, mapper))], row_index + 1}
  end

  def cells(row, row_identifier, mapper) do
    Enum.map_reduce(row, [65], fn cell, count ->
      {attrs, body} = mapper.(cell)

      {c(body, Map.merge(attrs, %{r: row_identifier <> alphabet_to_string(count)})),
       next_alphabet(count)}
    end)
    |> elem(0)
  end

  def next_alphabet([x | rest]) when x >= 65 and x < 90, do: [x + 1 | rest]
  def next_alphabet([]), do: [65]
  def next_alphabet([x | rest]) when x == 90, do: [65 | next_alphabet(rest)]

  def alphabet_to_string(x), do: IO.chardata_to_string(Enum.reverse(x))
end
