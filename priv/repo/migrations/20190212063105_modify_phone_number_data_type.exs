defmodule Nailinda.Repo.Migrations.ModifyPhoneNumberDataType do
  use Ecto.Migration

  def change do
    alter table(:patients) do
      modify :phone_number, :string
    end
  end
end
