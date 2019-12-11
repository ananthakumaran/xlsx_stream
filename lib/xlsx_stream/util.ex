defmodule XlsxStream.Util do
  alias XmlStream, as: X
  
  def counted(name, body \\ [], attrs \\ %{}) do
    X.element(name, Map.merge(%{count: to_string(length(body))}, attrs), body)
  end
end
