defmodule Nailinda.Repo do
  use Ecto.Repo,
    otp_app: :nailinda,
    adapter: Ecto.Adapters.Postgres
end
