defmodule Phxnix.Repo do
  use Ecto.Repo,
    otp_app: :phxnix,
    adapter: Ecto.Adapters.Postgres
end
