defmodule Nailinda.User do
  @moduledoc """
   This is for all the users context
  """
  alias Nailinda.Redis
  alias Nailinda.Repo
  alias Nailinda.User.{Doctor, Patient}

  def create_patient(attrs) do
    %{"location" => location} = attrs

    loc = String.split(location)

    [long, lat] = Enum.take(loc, 2)
    [_h, _h1 | t] = loc
    member = Enum.join(t, " ")

    Redis.save_patient_location(long, lat, member)

    %Patient{}
    |> Patient.changeset(attrs)
    |> Repo.insert()
  end

  def update_patient(patient, attrs) do
    patient
    |> Patient.changeset(attrs)
    |> Repo.update()
  end

  def get_all_patients do
    Patient
    |> Repo.all()
  end

  def get_patient_by_id(id) do
    Patient
    |> Repo.get(id)
  end

  def delete_patient(%Patient{} = patient) do
    Repo.delete(patient)
  end

  def create_doctor(attrs) do
    %Doctor{}
    |> Doctor.changeset(attrs)
    |> Repo.insert()
  end

  def get_doctor_by_id(id) do
    Doctor
    |> Repo.get!(id)
  end

  def get_all_doctors do
    Doctor
    |> Repo.all()
  end

  def delete_doctor(%Doctor{} = doctor) do
    Repo.delete(doctor)
  end

  def update_doctor(%Doctor{} = doctor, doctor_params) do
    doctor
    |> Doctor.changeset(doctor_params)
    |> Repo.update()
  end
end
