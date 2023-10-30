defmodule Saner.MixProject do
  use Mix.Project

  def project do
    [
      app: :saner,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "credo checks to make coding a bit saner",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        coverage: :test,
        "coverage.html": :test,
        "coveralls.html": :test,
        "coveralls.post": :test,
        "coveralls.detail": :test,
        "coveralls.github": :test,
        test: :test,
        "test.watch": :test
      ],
      package: package()
    ]
  end

  defp package do
    [
      files: [
        ".credo.exs",
        "lib",
        "mix.exs",
        "README.md",
        "LICENSE"
      ],
      maintainers: ["Jacek Królikowski"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/nietaki/funused_credo_plugin"
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, ">= 0.0.0"},

      # test/housekeeping stuff
      {:dialyxir, ">= 1.0.0", only: [:dev], optional: true, runtime: false},
      {:ex_doc, ">= 0.18.0", optional: true, only: :dev},
      {:excoveralls, "~> 0.16", optional: true, only: :test},
      {:mix_test_watch, ">= 0.5.0", optional: true, runtime: false, only: [:dev, :test]}
    ]
  end
end
