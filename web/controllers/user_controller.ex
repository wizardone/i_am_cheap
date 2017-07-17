defmodule IAmCheap.UserController do
  require Logger
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

  def create(conn, %{"user" => user_params}) do
    changeset = %User{} |> User.changeset(user_params)

    case Repo.insert(changeset) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "User create")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
