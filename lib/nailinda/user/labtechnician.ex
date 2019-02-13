defmodule Nailinda.User.Labtechnician do
    @moduledoc """
    labtechnician module
    """
    use Ecto.Schema
    import Ecto.Changeset
  
    schema "labtechnicians" do
      field(:first_name, :string)
      field(:last_name, :string)
      field(:date_of_birth, :date)
      field(:work_station, :string)
      field(:id_number, :integer)
      field(:phone_number, :string)
    
  
      timestamps()
    end
  
    def changeset(labtechnician, attrs) do
      labtechnician
      |> cast(attrs, [
        :first_name,
        :last_name,
        :date_of_birth,
        :work_station,
        :id_number,
        :phone_number
      ])
      |> validate_required([:first_name, :last_name, :date_of_birth, :work_station,
      :id_number,:phone_number ])
    end
   end
  