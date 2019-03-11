defmodule Nailinda.User.Location do
  use Ecto.Schema
  import Ecto.Changeset
  alias Nailinda.User.Patient

  schema "locations" do
    field :location, :string
    timestamps()
  end

  @doc false
  def location_changeset(location, attrs) do
    location
    |> cast(attrs, [:location])
    |> validate_required([:location])
  end
end
