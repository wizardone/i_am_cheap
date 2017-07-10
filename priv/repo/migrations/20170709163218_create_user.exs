defmodule IAmCheap.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :crypted_password, :string, null: false
      add :token, :string
      timestamps()
    end
    create index(:users, :email, unique: true)
  end
end
