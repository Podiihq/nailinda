defmodule :"Elixir.Nailinda.Repo.Migrations.Remove-location-column" do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      remove :location
    end
  end
end
