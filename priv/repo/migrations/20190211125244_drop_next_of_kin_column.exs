defmodule Nailinda.Repo.Migrations.DropNextOfKinColumn do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      remove :next_of_kin
    end
  end
end
