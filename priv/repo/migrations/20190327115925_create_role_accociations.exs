defmodule Nailinda.Repo.Migrations.CreateRoleAccociations do
  use Ecto.Migration

  def change do
    alter table(:doctors) do
      add :role_id, references(:roles)
    end

    alter table(:patients) do
      add :role_id, references(:roles)
    end
  end
end
