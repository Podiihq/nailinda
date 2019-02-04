defmodule Nailinda.Repo.Migrations.CreatePatient do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :first_name, :string
      add :last_name, :string
      add :date_of_birth, :date
      add :location, :string
      add :id_number, :integer
      add :phone_number, :integer
      add :next_of_kin, :string

      timestamps()
    end

    create unique_index(:patients, [:id_number])
  end
end
