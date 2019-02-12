defmodule Nailinda.User.Patient do
  @moduledoc """
  patients module
  """
  use Ecto.Schema
  import Ecto.Changeset
  alias Nailinda.User.Location

  schema "patients" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:date_of_birth, :date)
    field(:id_number, :integer)
    field(:phone_number, :integer)
    field(:next_of_kin, :string)
    has_one(:location, Location)

    timestamps()
  end

  def changeset(patient, attrs) do
    patient
    # |> cast(attrs, [
    #   :first_name,
    #   :last_name,
    #   :date_of_birth,
    #   :id_number,
    #   :phone_number,
    #   :next_of_kin
    # ])
    |> changeset(attrs)
    |> cast_assoc(:location, with: &Location.changeset/2, required: true)
    # |> validate_required([:first_name, :last_name, :date_of_birth])
  end
 end
