require IEx
defmodule IAmCheap.SessionController do
  use IAmCheap.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{ "email" => email, "password" => password }}) do
    user = IAmCheap.User |> IAmCheap.Repo.get_by(email: email)
    case user do
      nil ->
        conn
        |> put_flash(:error, "Please check your credentials")
        |> render("new.html")
      _ ->
        case Comeonin.Bcrypt.checkpw(password, user.crypted_password) do
          true ->
            conn
            |> put_session(:current_user, user.id)
            |> put_flash(:info, "Logic successfull")
            |> redirect(to: user_path(conn, :index))
          false ->
            conn
            |> put_flash(:error, "Incorrect password")
            |> render("new.html")
        end
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: user_path(conn, :index))
  end
end
