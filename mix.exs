defmodule Stripe.Mixfile do
  use Mix.Project

  @version "0.7.1"

  def project do
    [app: :stripe,
     version: @version,
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     elixirc_paths: elixirc_paths(Mix.env),
     deps: deps(),
     package: package(),
     description: description()]
  end

  def description do
    "Stripe API Client for Elixir"
  end

  def package do
    [
      name: "stripe_elixir",
      maintainers: ["Sikan He"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/sikanhe/stripe-elixir"}
    ]
  end

  defp elixirc_paths(env) when env in [:dev, :test, :prod], do: ["lib", "test/support"]

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:httpoison, "~> 0.11"},
     {:poison, "~> 2.2 or ~> 3.0"},

     # Docs
     {:ex_doc, "~> 0.10", only: :dev},
     {:earmark, "~> 0.1", only: :dev},
     {:inch_ex, ">= 0.0.0", only: :dev}]
  end
end
