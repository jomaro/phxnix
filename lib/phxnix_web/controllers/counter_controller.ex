defmodule PhxnixWeb.CounterController do
  use PhxnixWeb, :controller

  alias Phxnix.Counter

  def get(conn, _params) do
    conn
    |> text(Counter.get())
  end

  def inc(conn, _params) do
    conn
    |> text(Counter.inc())
  end
end
