defmodule NailindaWeb.PageController do
  use NailindaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
