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
  end

  def hash_password(changeset) do
  end

  def passwords_equal do
    
  end
end
