defmodule IAmCheap.UserControllerTest do
  use IAmCheap.ConnCase

  alias IAmCheap.User
  @valid_attrs %{email: "qwe@qwe.com",
                 password: "123456",
                 confirm_password: "123456"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, user_path(conn, :index)

    assert html_response(conn, 200) =~ "Listing users"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, user_path(conn, :new)

    assert html_response(conn, 200) =~ "New user"
  end

  test "shows a user resource", %{conn: conn} do
    user = Repo.insert!(%User{email: "test@test.com", password: "qweqweqwe"})
    conn = get conn, user_path(conn, :show, user)

    assert html_response(conn, 200) =~ "Show user"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_attrs

    assert redirected_to(conn) == user_path(conn, :index)
    assert Repo.get_by(User, %{email: "qwe@qwe.com"})
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @invalid_attrs

    assert html_response(conn, 200) =~ "New user"
  end

  test "deletes resource and redirects to the index", %{conn: conn} do
    user = Repo.insert!(%User{email: "test@test.com", password: "qweqweqwe"})
    conn = delete conn, user_path(conn, :delete, user)

    assert redirected_to(conn) == user_path(conn, :index)
    refute Repo.get(User, user.id)
  end
end
