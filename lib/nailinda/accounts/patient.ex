defmodule Nailinda.Accounts.Patient do
  @moduledoc """
  patients module
  """
  import Ecto.Changeset
  use Ecto.Schema
  alias Nailinda.Accounts.Role

  schema "patients" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:date_of_birth, :date)
    field(:id_number, :integer)
    field(:phone_number, :string)
    field(:next_of_kin, :string)
    field(:location, :string)
    belongs_to :role, Role

    timestamps()
  end

  def changeset(patient, attrs \\ %{}) do
    patient
    |> cast(attrs, [
      :first_name,
      :last_name,
      :date_of_birth,
      :id_number,
      :phone_number,
      :next_of_kin,
      :location,
      :role_id
    ])
    |> validate_required([:first_name, :last_name, :date_of_birth, :role_id])
    |> unique_constraint(:id_number)
    |> foreign_key_constraint(:role_id)
    |> _validate_date_is_not_future
  end

  defp _validate_date_is_not_future(changeset) do
    input_date = get_field(changeset, :date_of_birth)

    if input_date do
      case Date.compare(Date.utc_today(), input_date) do
        :lt -> add_error(changeset, :date_of_birth, "cannot be a future date")
        :gt -> changeset
        :eq -> changeset
      end
    else
      changeset
    end
  end
end
