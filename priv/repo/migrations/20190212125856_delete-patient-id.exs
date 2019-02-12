defmodule :"Elixir.Nailinda.Repo.Migrations.Delete-patient-id" do
  use Ecto.Migration

  def change do
     alter table(:locations) do
     	remove :patient_id
     end
  end
end
