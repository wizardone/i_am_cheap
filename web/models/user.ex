defmodule IAmCheap.User do
  use IAmCheap.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :confirm_password, :string, virtual: true
    field :crypted_password, :string
    field :token, :string
    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :confirm_password])
    |> validate_required([:email, :password, :confirm_password])
    |> validate_length(:password, min: 6)
    |> validate_passwords_equal
    |> hash_password
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :crypted_password, Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end

  defp validate_passwords_equal(changeset) do
    password = get_field(changeset, :password)
    password_confirm = get_field(changeset, :confirm_password)
    validate_passwords_equal(changeset, password, password_confirm)
  end

  defp validate_passwords_equal(changeset, password, password_confirmation) do
    cond do
      password == password_confirmation ->
        changeset
      password != password_confirmation ->
        add_error(changeset, :confirm_password, "did not match password")
    end
  end
end
