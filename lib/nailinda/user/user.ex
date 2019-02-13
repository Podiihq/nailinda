defmodule Nailinda.User do
 @moduledoc """
   This is the patients context
  """
  alias Nailinda.Repo
  alias Nailinda.User.Patient
  alias Nailinda.User.Location

  def create_patient(attrs) do
    %Patient{}
     |>Patient.changeset(attrs)
     |> Repo.insert()
  end

 def update_patient(patient, attrs) do
    patient
      |> Patient.changeset(attrs)
      |> Repo.update()
  end

  def get_all_patients do
    Patient
    |> Repo.all
  end

  def get_patient_by_id(id) do
    Patient
    |> Repo.get(id)
  end

  def create_new_location(location) do
        %Location{}
        |> Location.changeset(%{location: location})
        |> Repo.insert()

        # Redis.geoadd(location)
    end
end
