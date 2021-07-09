defmodule ExToolset.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_toolset,
      version: "0.0.1",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # Docs
      name: "ExToolset",
      source_url: "https://github.com/eficiencia-fiscal/ex_toolset",
      homepage_url: "https://eficiencia-fiscal.github.io/ex-toolset/",
      docs: [
        # The main page in the docs
        main: "ExToolset",
        logo: "priv/logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :xmerl]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.22.0", only: :dev, runtime: false},
      {:joken, "~> 2.0"},
      {:jason, "~> 1.1"},
      {:hackney, "~> 1.16"},
    ]
  end
end
