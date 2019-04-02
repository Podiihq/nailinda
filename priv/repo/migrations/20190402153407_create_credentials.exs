defmodule Nailinda.Repo.Migrations.CreateCredentials do
  use Ecto.Migration

  def change do
    create table(:credentials) do
      add :email, :string
      add :password_hash, :string

      timestamps()
    end

    create(unique_index(:credentials, :email))
  end
end
