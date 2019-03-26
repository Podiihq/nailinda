defmodule NailindaWeb.PatientController do
  use NailindaWeb, :controller

  alias Nailinda.Accounts
  alias Nailinda.Accounts.Patient

  def new(conn, _params) do
    changeset = Patient.changeset(%Patient{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"patient" => patient_params}) do
    case Accounts.create_patient(patient_params) do
      {:ok, %Patient{} = patient} ->
        conn
        |> put_flash(:info, "#{patient.first_name}  created successfuly")
        |> redirect(to: "/patient")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def index(conn, _params) do
    patients = Accounts.get_all_patients()
    render(conn, "index.html", patients: patients)
  end

  def show(conn, %{"id" => id}) do
    patient = Accounts.get_patient_by_id(id)
    render(conn, "show.html", patient: patient)
  end

  def edit(conn, %{"id" => id}) do
    patient = Accounts.get_patient_by_id(id)
    changeset = Patient.changeset(patient, %{})
    render(conn, "edit.html", patient: patient, changeset: changeset)
  end

  def update(conn, %{"id" => id, "patient" => attrs}) do
    patient = Accounts.get_patient_by_id(id)

    case Accounts.update_patient(patient, attrs) do
      {:ok, %Patient{}} ->
        conn
        |> put_flash(:info, "Successfully update")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Updating failed")
        |> render("edit.html", changeset: changeset, patient: patient)
    end
  end

  def delete(conn, %{"id" => id}) do
    patient = Accounts.get_patient_by_id(id)
    {:ok, _patient} = Accounts.delete_patient(patient)

    conn
    |> put_flash(:info, " Deleted successfuly")
    |> redirect(to: "/")
  end

  def locations(conn, _params) do
    locations = Accounts.get_patient_locations()
    render(conn, "locations.html", locations: locations)
  end
end
