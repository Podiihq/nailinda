defmodule NailindaWeb.HospitalController do
  use NailindaWeb, :controller

  alias Nailinda.Facilities
  alias Nailinda.Facilities.Hospital

  def new(conn, _params) do
    changeset = Hospital.changeset(%Hospital{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"hospital" => hospital_params}) do
    case Facilities.create_hospital(hospital_params) do
      {:ok, _hospital_params} ->
        conn
        |> put_flash(:info, "successful")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    hospital = Facilities.get_hospital_by_id(id)
    render(conn, "show.html", hospital: hospital)
  end

  def index(conn, _params) do
    hospitals = Facilities.get_all_hospitals()
    render(conn, "index.html", hospitals: hospitals)
  end

  def edit(conn, %{"id" => id}) do
    hospital = Facilities.get_hospital_by_id(id)
    changeset = Hospital.changeset(hospital, %{})
    render(conn, "edit.html", hospital: hospital, changeset: changeset)
  end

  def update(conn, %{"id" => id, "hospital" => attrs}) do
    hospital = Facilities.get_hospital_by_id(id)

    case Facilities.update_hospital_details(hospital, attrs) do
      {:ok, %Hospital{}} ->
        conn
        |> put_flash(:info, "Successfully updated")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Updating failed")
        |> render("edit.html", changeset: changeset, hospital: hospital)
    end
  end

  def delete(conn, %{"id" => id}) do
    hospital = Facilities.get_hospital_by_id(id)
    {:ok, _} = Facilities.delete_hospital(hospital)

    conn
    |> put_flash(:info, " Deleted successfuly")
    |> redirect(to: "/")
  end
end
