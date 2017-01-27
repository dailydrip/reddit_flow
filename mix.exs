defmodule RedditFlow.Mixfile do
  use Mix.Project

  def project do
    [app: :reddit_flow,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger],
     mod: {RedditFlow.Application, []}]
  end

  defp deps do
    [
      {:flow, "~> 0.11"},
      {:faker, "~> 0.7"},
      {:poison, "~> 3.1.0"},
      {:httpoison, "~> 0.11.0"},
    ]
  end
end
