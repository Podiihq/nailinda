defmodule NailindaWeb.DoctorController do
  use NailindaWeb, :controller
  alias Nailinda.Accounts
  alias Nailinda.Accounts.Doctor

  def new(conn, _params) do
    changeset = Doctor.changeset(%Doctor{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"doctor" => doctor_params}) do
    case Accounts.create_doctor(doctor_params) do
      {:ok, _doctor_params} ->
        conn
        |> put_flash(:info, "successful")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    doctor = Accounts.get_doctor_by_id(id)
    render(conn, "show.html", doctor: doctor)
  end

  def index(conn, _params) do
    doctors = Accounts.get_all_doctors()
    render(conn, "index.html", doctors: doctors)
  end

  def delete(conn, %{"id" => id}) do
    doctor = Accounts.get_doctor_by_id(id)
    {:ok, _doctor} = Accounts.delete_doctor(doctor)

    conn
    |> put_flash(:info, "ID #{doctor.id} Deleted successfuly")
    |> redirect(to: "/")
  end

  def edit(conn, %{"id" => id}) do
    doctor = Accounts.get_doctor_by_id(id)
    changeset = Doctor.changeset(doctor, %{})
    render(conn, "edit.html", doctor: doctor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "doctor" => doctor_params}) do
    doctor = Accounts.get_doctor_by_id(id)

    case Accounts.update_doctor(doctor, doctor_params) do
      {:ok, %Doctor{}} ->
        conn
        |> put_flash(:info, "ID #{doctor.id} Successfully update")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Updating failed")
        |> render("edit.html", doctor: doctor, changeset: changeset)
    end
  end
end
