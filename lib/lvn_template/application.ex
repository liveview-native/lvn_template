defmodule LvnTemplate.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LvnTemplateWeb.Telemetry,
      # Start the Ecto repository
      LvnTemplate.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LvnTemplate.PubSub},
      # Start Finch
      {Finch, name: LvnTemplate.Finch},
      # Start the Endpoint (http/https)
      LvnTemplateWeb.Endpoint,
      # Start a worker by calling: LvnTemplate.Worker.start_link(arg)
      # {LvnTemplate.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LvnTemplate.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LvnTemplateWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
