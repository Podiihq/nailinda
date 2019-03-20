defmodule Nailinda.Repo.Migrations.Addlocationcolumn do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      add :location, :string
    end
  end
end
