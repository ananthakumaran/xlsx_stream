defmodule XlsxStream.DocProps do
  alias XmlStream, as: X
  alias XlsxStream.Schema

  def app do
    [
      X.declaration(),
      X.empty_element("Properties", %{
        xmlns: Schema.extended_properties(),
        "xmlns:vt": Schema.doc_props_v_types()
      })
    ]
  end

  def core do
    body = [creator(), created(), revision()]

    [
      X.declaration(),
      X.element(
        "cp:coreProperties",
        %{
          "xmlns:cp": Schema.metadata("core-properties"),
          "xmlns:dc": "http://purl.org/dc/elements/1.1/",
          "xmlns:dcmitype": "http://purl.org/dc/dcmitype/",
          "xmlns:dcterms": "http://purl.org/dc/terms/",
          "xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance"
        },
        body
      )
    ]
  end

  def creator() do
    X.element("dc:creator", X.content("XlsxStream"))
  end

  def created() do
    now = DateTime.utc_now() |> DateTime.to_iso8601()
    X.element("dcterms:created", %{"xsi:type": "dcterms:W3CDTF"}, X.content(now))
  end

  def revision() do
    X.element("cp:revision", X.content("0"))
  end
end
