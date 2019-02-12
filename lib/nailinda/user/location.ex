defmodule Nailinda.User.Location do
  use Ecto.Schema
  import Ecto.Changeset
  alias Nailinda.User.Patient

  schema "locations" do
    field :location, :string
    belongs_to(:patient, Patient)
    timestamps()
  end

  @doc false
  def location_changeset(location, attrs) do
    location
    |> cast(attrs, [:location, :patient_id])
    |> validate_required([:location, :patient_id])
  end
end
