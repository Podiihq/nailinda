defmodule Nailinda.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :location, :string

      timestamps()
    end

  end
end
