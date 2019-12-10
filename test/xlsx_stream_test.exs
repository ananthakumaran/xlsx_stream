defmodule XlsxStreamTest do
  alias XlsxStream.Schema
  alias XlsxStream.Relationship
  alias XlsxStream.ContentType
  alias XlsxStream.Workbook
  alias XlsxStream.StyleSheet, as: S
  alias XlsxStream.Worksheet, as: W
  use ExUnit.Case
  doctest XlsxStream

  test "creates xlsx file" do
    rels =
      Relationship.document([
        Relationship.relationship(%{
          Target: "xl/workbook.xml",
          Type: Schema.relationships("officeDocument"),
          Id: "rId1"
        }),
        Relationship.relationship(%{
          Target: "docProps/core.xml",
          Type: Schema.relationships("metadata/core-properties"),
          Id: "rId2"
        }),
        Relationship.relationship(%{
          Target: "docProps/app.xml",
          Type: Schema.relationships("extended-properties"),
          Id: "rId3"
        })
      ])

    content_type =
      ContentType.document([
        ContentType.default(%{
          ContentType: "application/vnd.openxmlformats-package.relationships+xml",
          Extension: "rels"
        }),
        ContentType.default(%{ContentType: "application/xml", Extension: "xml"}),
        ContentType.override(%{
          PartName: "/docProps/app.xml",
          ContentType: "application/vnd.openxmlformats-officedocument.extended-properties+xml"
        }),
        ContentType.override(%{
          PartName: "/docProps/core.xml",
          ContentType: "application/vnd.openxmlformats-package.core-properties+xml"
        }),
        ContentType.override(%{
          PartName: "/xl/styles.xml",
          ContentType: "application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"
        }),
        ContentType.override(%{
          PartName: "/xl/workbook.xml",
          ContentType:
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"
        }),
        ContentType.override(%{
          PartName: "/xl/worksheets/sheet1.xml",
          ContentType: "application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"
        })
      ])

    app = XlsxStream.DocProps.app()
    core = XlsxStream.DocProps.core()

    workbook_rels =
      Relationship.document([
        Relationship.relationship(%{
          Target: "worksheets/sheet1.xml",
          Type: Schema.relationships("worksheet"),
          Id: "rId4"
        }),
        Relationship.relationship(%{
          Target: "styles.xml",
          Type: Schema.relationships("styles"),
          Id: "rId5"
        })
      ])

    workbook =
      Workbook.document([
        Workbook.sheet(%{name: "Midtrans Payments", sheetId: "1", "r:id": "rId4"})
      ])

    worksheet_rels = Relationship.document([])

    stylesheet =
      S.document([
        S.num_fmts([
          S.num_fmt(%{numFmtId: "100", formatCode: "yyyy/mm/dd"}),
          S.num_fmt(%{numFmtId: "101", formatCode: "yyyy/mm/dd hh:mm:ss"}),
          S.num_fmt(%{numFmtId: "102", formatCode: "[$-409]m/d/yy h:mm AM/PM;@"}),
          S.num_fmt(%{
            numFmtId: "103",
            formatCode:
              "&quot;IDR&quot;* #,##0;&quot;IDR&quot;* #,##0;&quot;IDR&quot;* &quot;-&quot;;@"
          })
        ]),
        S.fonts([
          S.font([
            S.name(%{val: "Arial"}),
            S.sz(%{val: "11"}),
            S.family(%{val: "1"})
          ]),
          S.font([
            S.name(%{val: "Arial"}),
            S.sz(%{val: "11"}),
            S.family(%{val: "1"}),
            S.b(%{val: "1"})
          ]),
          S.font([
            S.name(%{val: "Arial"}),
            S.sz(%{val: "11"}),
            S.family(%{val: "1"}),
            S.color(%{rgb: "FF000000"})
          ])
        ]),
        S.fills([
          S.fill([S.pattern_fill(%{patternType: "none"})]),
          S.fill([S.pattern_fill(%{patternType: "gray125"})]),
          S.fill([S.pattern_fill([S.fg_color(%{rgb: "FFFFFF00"})], %{patternType: "solid"})])
        ]),
        S.borders([
          S.border([]),
          S.border([
            S.left([S.color(%{rgb: "FF000000"})], %{style: "thin"}),
            S.right([S.color(%{rgb: "FF000000"})], %{style: "thin"}),
            S.top([S.color(%{rgb: "FF000000"})], %{style: "thin"}),
            S.bottom([S.color(%{rgb: "FF000000"})], %{style: "thin"})
          ])
        ]),
        S.cell_style_xfs([
          S.xf([], %{borderId: "0", numFmtId: "0", fontId: "0", fillId: "0"})
        ]),
        S.cell_xfs([
          S.xf([], %{borderId: "0", numFmtId: "0", fontId: "0", fillId: "0", xfId: "0"}),
          S.xf([], %{borderId: "1", numFmtId: "0", fontId: "0", fillId: "0", xfId: "0"}),
          S.xf([], %{
            borderId: "0",
            numFmtId: "14",
            fontId: "0",
            fillId: "0",
            xfId: "0",
            applyNumberFormat: "1"
          }),
          S.xf([S.alignment(%{vertical: "center"})], %{
            borderId: "0",
            numFmtId: "0",
            fontId: "1",
            fillId: "0",
            applyNumberFormat: "0",
            applyFill: "0",
            applyFont: "1",
            applyBorder: "0",
            applyAlignment: "1",
            applyProtection: "0"
          }),
          S.xf([], %{
            borderId: "0",
            numFmtId: "102",
            fontId: "0",
            fillId: "0",
            applyNumberFormat: "1",
            applyFill: "0",
            applyFont: "0",
            applyBorder: "0",
            applyAlignment: "0",
            applyProtection: "0"
          }),
          S.xf([], %{
            borderId: "0",
            numFmtId: "103",
            fontId: "0",
            fillId: "0",
            applyNumberFormat: "1",
            applyFill: "0",
            applyFont: "0",
            applyBorder: "0",
            applyAlignment: "0",
            applyProtection: "0"
          }),
          S.xf([], %{
            borderId: "0",
            numFmtId: "0",
            fontId: "2",
            fillId: "0",
            applyNumberFormat: "0",
            applyFill: "0",
            applyFont: "1",
            applyBorder: "0",
            applyAlignment: "0",
            applyProtection: "0"
          })
        ]),
        S.cell_styles([S.cell_style(%{name: "Normal", xfId: "0"})]),
        S.dxfs([]),
        S.table_styles([], %{
          defaultTableStyle: "TableStyleMedium9",
          defaultPivotStyle: "PivotStyleLight16",
          count: "0"
        })
      ])

    sheet_data =
      Stream.map(1..10, fn i -> i..(i + 5) end)
      |> Stream.transform(1, fn row, state ->
        W.row(row, fn i -> {%{s: "5", t: "n"}, W.v(XmlStream.content(to_string(i)))} end, state)
      end)

    sheet =
      W.document([
        W.sheet_pr([W.page_setup_pr(%{fitToPage: "0"})]),
        W.sheet_views([
          W.sheet_view(%{
            windowProtection: "0",
            tabSelected: "0",
            showWhiteSpace: "0",
            showOutlineSymbols: "0",
            showFormulas: "0",
            rightToLeft: "0",
            showZeros: "1",
            showRuler: "1",
            showRowColHeaders: "1",
            showGridLines: "1",
            defaultGridColor: "1",
            zoomScale: "100",
            workbookViewId: "0",
            zoomScaleSheetLayoutView: "0",
            zoomScalePageLayoutView: "0",
            zoomScaleNormal: "0"
          })
        ]),
        W.sheet_format_pr(%{baseColWidth: "8", defaultRowHeight: "18"}),
        W.cols([
          W.col(%{min: "1", max: "1", bestFit: "1", customWidth: "1", width: "25.151515151515152"}),
          W.col(%{min: "2", max: "2", bestFit: "1", customWidth: "1", width: "15.151515151515152"}),
          W.col(%{min: "3", max: "3", bestFit: "1", customWidth: "1", width: "16.212121212121215"}),
          W.col(%{min: "4", max: "4", bestFit: "1", customWidth: "1", width: "14.545454545454547"}),
          W.col(%{min: "5", max: "5", bestFit: "1", customWidth: "1", width: "16.212121212121215"}),
          W.col(%{min: "6", max: "6", bestFit: "1", customWidth: "1", width: "19.393939393939394"}),
          W.col(%{min: "7", max: "7", bestFit: "1", customWidth: "1", width: "9.84848484848485"}),
          W.col(%{min: "8", max: "8", bestFit: "1", customWidth: "1", width: "21.060606060606062"}),
          W.col(%{min: "9", max: "9", bestFit: "1", customWidth: "1", width: "26.515151515151516"})
        ]),
        W.sheet_data(sheet_data),
        W.sheet_calc_pr(%{fullCalcOnLoad: "1"}),
        W.print_options(%{
          verticalCentered: "0",
          horizontalCentered: "0",
          headings: "0",
          gridLines: "0"
        }),
        W.page_margins(%{
          right: "0.75",
          left: "0.75",
          bottom: "1.0",
          top: "1.0",
          footer: "0.5",
          header: "0.5"
        }),
        W.page_setup(%{}),
        W.header_footer(%{}),
        W.merge_cells([W.merge_cell(%{ref: "A1:A2"})])
      ])

    files = [
      XlsxStream.file(content_type, "[Content_Types].xml"),
      XlsxStream.file(rels, "_rels/.rels"),
      XlsxStream.file(app, "docProps/app.xml"),
      XlsxStream.file(core, "docProps/core.xml"),
      XlsxStream.file(workbook_rels, "xl/_rels/workbook.xml.rels"),
      XlsxStream.file(worksheet_rels, "xl/worksheets/_rels/sheet1.xml.rels"),
      XlsxStream.file(workbook, "xl/workbook.xml"),
      XlsxStream.file(stylesheet, "xl/styles.xml"),
      XlsxStream.file(sheet, "xl/worksheets/sheet1.xml")
    ]

    Temp.track!()
    path = Temp.path!(%{suffix: ".xlsx"})

    assert !File.exists?(path)

    XlsxStream.stream!(files)
    |> Stream.into(File.stream!(path))
    |> Stream.run()

    assert File.exists?(path)
    File.rm!(path)
  end
end
