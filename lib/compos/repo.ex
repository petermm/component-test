defmodule Compos.Repo do
  use Ecto.Repo,
    otp_app: :compos,
    adapter: Ecto.Adapters.Postgres
end
