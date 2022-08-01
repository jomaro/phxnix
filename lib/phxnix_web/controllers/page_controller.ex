defmodule PhxnixWeb.PageController do
  use PhxnixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
