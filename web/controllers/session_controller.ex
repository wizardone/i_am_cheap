defmodule IAmCheap.SessionController do
  use IAmCheap.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, params) do
    
  end
end
