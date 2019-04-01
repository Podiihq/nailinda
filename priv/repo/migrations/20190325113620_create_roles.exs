defmodule Nailinda.Repo.Migrations.CreateRoles do
  use Ecto.Migration

  def change do
    create table(:roles) do
      add :role, :string

      timestamps()
    end

    create unique_index(:roles, [:role])
  end
end
