defmodule Helix.MixProject do
  use Mix.Project

  def project do
    [
      app: :helix,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Helix",
      docs: [
        main: "Helix"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.4.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:exvcr, "~> 0.10", only: :test},
      {:httpoison, "~> 1.6"}
    ]
  end
end
