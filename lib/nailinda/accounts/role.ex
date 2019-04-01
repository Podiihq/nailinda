defmodule Nailinda.Accounts.Role do
  @moduledoc """
  Roles module
  """
  import Ecto.Changeset
  use Ecto.Schema
  alias Nailinda.Accounts.Doctor
  alias Nailinda.Accounts.Patient

  schema "roles" do
    field(:role, :string)
    has_many :doctors, Doctor
    has_many :patients, Patient

    timestamps()
  end

  def changeset(role, attrs \\ %{}) do
    role
    |> cast(attrs, [:role])
    |> validate_required([:role])
    |> unique_constraint(:role)
  end
end
