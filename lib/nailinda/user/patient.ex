defmodule Nailinda.User.Patient do
  @moduledoc """
  patients module
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:date_of_birth, :date)
    field(:location, :string)
    field(:id_number, :integer)
    field(:phone_number, :integer)
    field(:next_of_kin, :string)

    timestamps()
  end

  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [
      :first_name,
      :last_name,
      :date_of_birth,
      :location,
      :id_number,
      :phone_number,
      :next_of_kin
    ])
    |> validate_required([:first_name, :last_name, :date_of_birth, :location])
  end
 end
