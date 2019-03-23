defmodule :"Elixir.Nailinda.Repo.Migrations.Create-hospitals" do
  use Ecto.Migration

  def change do
    create table(:hospitals) do
      add :hospital_name, :string
      add :number_of_beds, :integer
      add :classification, :string
      add :number_of_doctors, :integer
      add :location, :string

      timestamps()
    end
  end
end
