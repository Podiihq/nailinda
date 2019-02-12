defmodule Nailinda.Repo.Migrations.AddPhoneNumberToPatientsTable do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      add :phone_number, :string
    end
  end
end
