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
    hospitals = Facilities.get_all_hospitals
    render(conn, "index.html", hospitals: hospitals) 
  end

end

