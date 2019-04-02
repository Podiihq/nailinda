defmodule Nailinda.Admins.Admin do
  @moduledoc "module for administrators"
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do
    field :email, :string
    field :phone_number, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:username, :email, :phone_number])
    |> validate_required([:username, :email, :phone_number])
  end
end
