defmodule IAmCheap.UserController do
  use IAmCheap.Web, :controller

  alias IAmCheap.User
  def index(conn, _params) do
    users = IAmCheap.Repo.all(User)
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, params) do
    # %{"email" =>email, "password" => password, "confirm_password" => confirm_password}
    changeset = User.changeset(params)

    case Repo.update(changeset) do
      {:ok, } ->
        conn
        |> put_flash(:info, "User create")
        |> redirect(to: user_path(conn, :index))
    end
  end
end
