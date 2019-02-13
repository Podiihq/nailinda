defmodule Nailinda.Repo.Migrations.Labtechnician do
  use Ecto.Migration

  def change do
    create table(:labtechnicians) do
      add :first_name, :string
      add :last_name, :string
      add :date_of_birth, :date
      add :work_station, :string
      add :id_number, :integer
      add :phone_number, :string

      timestamps()
  end

  create unique_index(:labtechnicians, [:id_number])
end
end
