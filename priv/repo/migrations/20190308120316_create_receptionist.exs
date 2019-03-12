defmodule Nailinda.Repo.Migrations.CreateReceptionist do
  use Ecto.Migration

  def change do
    create table(:receptionists) do
      add :first_name, :string
      add :last_name, :string
      add :date_of_birth, :date
      add :location, :string
      add :id_number, :integer
      add :phone_number, :string
      add :next_of_kin, :string

      timestamps()
    end

    create unique_index(:receptionists, [:id_number])
  end
end
