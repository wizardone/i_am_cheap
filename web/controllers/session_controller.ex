require IEx
defmodule IAmCheap.SessionController do
  use IAmCheap.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{ "email" => email, "password" => password }}) do
    user = IAmCheap.User |> IAmCheap.Repo.get_by(email: email, crypted_password: password)
    case user do
      {:ok, %IAmCheap.User{}} ->
        IO.puts "OMG"
      nil ->
        conn
        |> put_flash(:error, "Incorrect credentials")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
  end
end
