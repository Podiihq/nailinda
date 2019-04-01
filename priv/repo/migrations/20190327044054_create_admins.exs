defmodule Nailinda.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :username, :string
      add :email, :string
      add :phone_number, :string

      timestamps()
    end
  end
end
