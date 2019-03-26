defmodule Nailinda.Accounts.Role do
  @moduledoc """
  Roles module
  """
  import Ecto.Changeset
  use Ecto.Schema

  schema "roles" do
    field(:role, :string)

    timestamps()
  end

  def changeset(role, attrs \\ %{}) do
    role
    |> cast(attrs, [:role])
    |> validate_required([:role])
    |> unique_constraint(:role)
  end
end
