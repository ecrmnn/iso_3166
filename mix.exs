defmodule Iso.Mixfile do
  use Mix.Project

  def project do
    [app: :iso_3166,
     version: "1.0.0",
     elixir: "~> 1.3",
     description: "Lookup information with ISO 3166-1 alpha-2, ISO 3166-1 alpha-3 and ISO 3166-1 numeric",
     deps: deps(),
     package: package()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: []]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:poison, "~> 3.0"},
     {:ex_doc, ">= 0.0.0", only: [:dev]}]
  end

  defp package do
    [# These are the default files included in the package
     name: :iso_3166,
     maintainers: ["Daniel Eckermann"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/ecrmnn/iso_3166",
              "Docs" => "https://hexdocs.pm/iso_3166"}
            ]
  end
end
