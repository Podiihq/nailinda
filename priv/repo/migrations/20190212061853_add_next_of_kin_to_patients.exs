defmodule Nailinda.Repo.Migrations.AddNextOfKinToPatients do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      add :next_of_kin, :string
    end
  end
end
