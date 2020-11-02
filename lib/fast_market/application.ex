defmodule FastMarket.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      FastMarket.Repo,
      # Start the Telemetry supervisor
      FastMarketWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: FastMarket.PubSub},
      # Start the Endpoint (http/https)
      FastMarketWeb.Endpoint
      # Start a worker by calling: FastMarket.Worker.start_link(arg)
      # {FastMarket.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FastMarket.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    FastMarketWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
