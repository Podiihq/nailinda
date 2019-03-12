defmodule Nailinda.Repo.Migrations.Doctor do
  use Ecto.Migration

  def change do
    create table(:doctors) do
      add :first_name, :string
      add :middle_name, :string
      add :surname, :string
      add :id_number, :integer
      add :department, :string
      add :speciality, :string
      add :email, :string
      add :location, :string

      timestamps()
    end

    create unique_index(:doctors, [:id_number])
  end
end
