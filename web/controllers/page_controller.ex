defmodule IAmCheap.PageController do
  use IAmCheap.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
