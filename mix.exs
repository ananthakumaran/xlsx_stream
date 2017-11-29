defmodule XlsxStream.Mixfile do
  use Mix.Project

  @version "0.1.1"

  def project do
    [
      app: :xlsx_stream,
      version: @version,
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      description: "Streaming XLSX builder",
      package: package(),
      docs: docs(),
      dialyzer: [
        plt_add_deps: :transitive,
        flags: [:unmatched_returns, :race_conditions, :error_handling, :underspecs]
      ],
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:xml_stream, "~> 0.2"},
      {:zstream, "~> 0.2"},
      {:temp, "~> 0.4", only: :test},
      {:ex_doc, "~> 0.18", only: :dev}
    ]
  end

  defp package do
    %{licenses: ["MIT"],
      links: %{"Github" => "https://github.com/ananthakumaran/xlsx_stream"},
      maintainers: ["ananthakumaran@gmail.com"]}
  end

  defp docs do
    [source_url: "https://github.com/ananthakumaran/xlsx_stream",
     source_ref: "v#{@version}",
     main: XmlStream,
     extras: ["README.md"]]
  end
end
