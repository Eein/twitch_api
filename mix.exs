defmodule TwitchApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :twitch_api,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "TwitchApi",
      docs: [
        main: "TwitchApi"
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :cachex],
      mod: {TwitchApi.Application, []}
    ]
  end

  defp deps do
    [
      {:credo, "~> 1.4.0", only: [:dev, :test], runtime: false},
      {:cachex, "~> 3.3"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:exvcr, "~> 0.11", only: :test},
      {:httpoison, "~> 1.6"}
    ]
  end
end
