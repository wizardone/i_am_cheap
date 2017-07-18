defmodule IAmCheap.UserTest do
  use IAmCheap.ModelCase

  alias IAmCheap.User

  @valid_attrs %{email: "test@test.com", password: "qweqwe", confirm_password: "qweqwe"}
  @invalid_attrs %{email: "some_random", password: "qwe"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
