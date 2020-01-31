defmodule Twitch.MixProject do
  use Mix.Project

  def project do
    [
      app: :twitch,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Twitch",
      docs: [
        main: "Twitch",
      ],
    ]
  end

  def application do
    [
      extra_applications: [:logger],
    ]
  end

  defp deps do
    [
      {:bypass, "~> 1.0", only: :test},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
    ]
  end
end
