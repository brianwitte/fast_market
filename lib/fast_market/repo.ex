defmodule FastMarket.Repo do
  use Ecto.Repo,
    otp_app: :fast_market,
    adapter: Ecto.Adapters.Postgres
end
