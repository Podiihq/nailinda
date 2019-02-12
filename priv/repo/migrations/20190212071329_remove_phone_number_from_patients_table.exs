defmodule Nailinda.Repo.Migrations.RemovePhoneNumberFromPatientsTable do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      remove :phone_number
    end
  end
end
