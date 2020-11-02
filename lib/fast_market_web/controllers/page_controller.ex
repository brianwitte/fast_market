defmodule FastMarketWeb.PageController do
  use FastMarketWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
