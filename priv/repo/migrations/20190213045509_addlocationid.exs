defmodule Nailinda.Repo.Migrations.Addlocationid do
  use Ecto.Migration

  def change do
  	alter table(:patients) do
  		add :location_id, references(:locations) 
  	end
  end
end
