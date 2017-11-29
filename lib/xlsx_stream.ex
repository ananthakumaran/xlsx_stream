defmodule XlsxStream do
  def file(document, name, options \\ []) do
    doc_options = [
      printer: XmlStream.Printer.Ugly
    ]
    stream = XmlStream.stream!(document, doc_options)
    |> buffer_stream(Keyword.get(options, :buffer, 16 * 1024))
    Zstream.entry(name, stream)
  end

  def stream!(files) do
    Zstream.zip(files)
  end

  defp buffer_stream(stream, buffer_size) do
    Stream.concat(stream, [:__eof__])
    |> Stream.transform({[], 0}, fn
      :__eof__, {buffer, size} ->
      if size > 0 do
        {[buffer], nil}
      else
        {[], nil}
      end
      chunk, {buffer, size} ->
        chunk_size = IO.iodata_length(chunk)
        buffer = if chunk_size > 0 do
          [buffer, chunk]
        else
          buffer
        end

        size = size + chunk_size
        cond do
          size > buffer_size -> {[buffer], {[], 0}}
          true -> {[], {buffer, size}}
        end
    end)
  end
end
