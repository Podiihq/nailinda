defmodule Nailinda.Accounts.Doctor do
  @moduledoc """
  doctor module
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Nailinda.Accounts.Role

  schema "doctors" do
    field(:first_name, :string)
    field(:middle_name, :string)
    field(:surname, :string)
    field(:id_number, :integer)
    field(:department, :string)
    field(:speciality, :string)
    field(:email, :string)
    field(:location, :string)
    belongs_to :role, Role

    timestamps()
  end

  def changeset(doctor, attr \\ %{}) do
    doctor
    |> cast(attr, [
      :first_name,
      :middle_name,
      :surname,
      :id_number,
      :department,
      :speciality,
      :email,
      :location,
      :role_id
    ])
    |> validate_required([
      :first_name,
      :middle_name,
      :surname,
      :id_number,
      :department,
      :speciality,
      :email,
      :location,
      :role_id
    ])
    |> foreign_key_constraint(:role_id)
  end
end
