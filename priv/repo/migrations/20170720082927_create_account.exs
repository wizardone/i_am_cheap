defmodule IAmCheap.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:account) do
      add :balance, :float, null: false
      add :user_id, references(:users), null: false, index: true
      timestamps()
    end
  end
end
