# XlsxStream

[![Hex.pm](https://img.shields.io/hexpm/v/xlsx_stream.svg)](https://hex.pm/packages/xlsx_stream)

A xlsx library could take two kind of approach

1) A simple api which supports limited functionality of xlsx
file. This would mostly take a list like data as input and would
create a xlsx file from it. Customization like custom style, custom
field width etc would be hard or not possible to implement via this
approach.

2) Provide the necessary low-level constructs required to create a
xlsx file. The user needs to be familiar with the xlsx
specification. But on the plus side, any kind of customization could
be done easily.

This library takes the second approach.


A [xlsx](http://officeopenxml.com/anatomyofOOXML-xlsx.php) file is a
zip file containing a number of XML files. This library utilizes
[xml_stream](https://github.com/activesphere/xml_stream) and
[zstream](https://github.com/ananthakumaran/zstream) to create XML
files and zip them as a stream. Check the test file for full example.

## Resources to learn xlsx file specification

*
  [SpreadsheetML](http://officeopenxml.com/anatomyofOOXML-xlsx.php)
  provides a highlevel overview of the xlsx file.

* simple tutorial to build a spreadsheet
  [part 1](https://blogs.msdn.microsoft.com/brian_jones/2006/11/02/simple-spreadsheetml-file-part-1-of-3/)
  [part 2](https://blogs.msdn.microsoft.com/brian_jones/2006/11/15/simple-spreadsheetml-file-part-2-of-3/)
  [part 3](https://blogs.msdn.microsoft.com/brian_jones/2007/05/29/simple-spreadsheetml-file-part-3-formatting/)
