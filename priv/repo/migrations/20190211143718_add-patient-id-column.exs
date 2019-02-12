defmodule :"Elixir.Nailinda.Repo.Migrations.Add-patient-id-column" do
  use Ecto.Migration

  def change do
  	alter table(:locations) do
  		add :patient_id, references(:patients) 
  	end
  end
end
