defmodule Nailinda.Facilities.Hospital do
  @moduledoc """
  hospital schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "hospitals" do
    field(:hospital_name, :string)
    field(:number_of_beds, :integer)
    field(:classification, :string)
    field(:number_of_doctors, :integer)
    field(:location, :string)

    timestamps()
  end

  def changeset(hospital, attr \\ %{}) do
    hospital
    |> cast(attr, [
      :hospital_name,
      :number_of_beds,
      :classification,
      :number_of_doctors,
      :location
    ])
    |> validate_required([
      :hospital_name,
      :location
    ])
  end
end
