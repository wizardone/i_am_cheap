defmodule IAmCheap.LayoutView do
  use IAmCheap.Web, :view

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: IAmCheap.Repo.get(IAmCheap.User, id).email
  end

  def logged_in?(conn) do
    !!current_user(conn)
  end
end
