defmodule LvnTemplate.Repo do
  use Ecto.Repo,
    otp_app: :lvn_template,
    adapter: Ecto.Adapters.Postgres
end
