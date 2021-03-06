defmodule HelloWorld.MixProject do
  use Mix.Project

  def project do
    [
      app: :helloworld,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  def deps do
    [
      {:mix_test_watch, "~> 0.6", only: :dev, runtime: false},
      {:ex_parameterized, "~> 1.3.1", only: :test, runtime: false}
    ]
  end
end
