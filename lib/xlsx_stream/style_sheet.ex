defmodule XlsxStream.StyleSheet do
  alias XmlStream, as: X
  alias XlsxStream.Schema
  alias XlsxStream.Utils

  def document(styles) do
    [
      X.declaration(),
      X.element("styleSheet", %{xmlns: Schema.spreedsheetml()}, styles)
    ]
  end

  def num_fmts(entries \\ [], attrs \\ %{}) do
    counted("numFmts", entries, attrs)
  end

  def num_fmt(attrs) do
    X.empty_element("numFmt", attrs)
  end

  def fonts(entries \\ [], attrs \\ %{}) do
    counted("fonts", entries, attrs)
  end

  def fills(entries \\ [], attrs \\ %{}) do
    counted("fills", entries, attrs)
  end

  def borders(entries \\ [], attrs \\ %{}) do
    counted("borders", entries, attrs)
  end

  def cell_style_xfs(entries \\ [], attrs \\ %{}) do
    counted("cellStyleXfs", entries, attrs)
  end

  def cell_xfs(entries \\ [], attrs \\ %{}) do
    counted("cellXfs", entries, attrs)
  end

  def cell_styles(entries \\ [], attrs \\ %{}) do
    counted("cellStyles", entries, attrs)
  end

  def table_styles(entries \\ [], attrs \\ %{}) do
    counted("tableStyles", entries, attrs)
  end

  def dxfs(entries \\ [], attrs \\ %{}) do
    counted("dxfs", entries, attrs)
  end

  def color(attrs) do
    X.empty_element("color", attrs)
  end

  def font(body, attrs \\ %{}) do
    X.element("font", attrs, body)
  end

  def fill(body, attrs \\ %{}) do
    X.element("fill", attrs, body)
  end

  def border(body, attrs \\ %{}) do
    X.element("border", attrs, body)
  end

  def left(body, attrs \\ %{}) do
    X.element("left", attrs, body)
  end

  def right(body, attrs \\ %{}) do
    X.element("right", attrs, body)
  end

  def top(body, attrs \\ %{}) do
    X.element("top", attrs, body)
  end

  def bottom(body, attrs \\ %{}) do
    X.element("bottom", attrs, body)
  end

  def xf(body, attrs \\ %{}) do
    X.element("xf", attrs, body)
  end

  def cell_style(attrs \\ %{}) do
    X.empty_element("cellStyle", attrs)
  end

  def name(attrs) do
    X.empty_element("name", attrs)
  end

  def sz(attrs) do
    X.empty_element("sz", attrs)
  end

  def family(attrs) do
    X.empty_element("family", attrs)
  end

  def b(attrs) do
    X.empty_element("b", attrs)
  end

  def pattern_fill(attrs) do
    X.empty_element("patternFill", attrs)
  end

  def pattern_fill(body, attrs) do
    X.element("patternFill", attrs, body)
  end

  def fg_color(attrs) do
    X.empty_element("fgColor", attrs)
  end

  def alignment(attrs) do
    X.empty_element("alignment", attrs)
  end

  defdelegate counted(name, body \\ [], attrs \\ %{}), to: Utils
end
