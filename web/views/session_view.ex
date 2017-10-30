defmodule IAmCheap.SessionView do
  use IAmCheap.Web, :view

  def csrf_token(conn) do
    Plug.Conn.get_session(conn, :csrf_token)
  end
end
