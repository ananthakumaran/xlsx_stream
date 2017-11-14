defmodule XlsxStream do
  def file(document, name) do
    options = [
      printer: XmlStream.Print.Ugly
    ]
    Zstream.entry(name, XmlStream.stream(document, options))
  end

  def stream(files) do
    Zstream.create(files)
  end
end
