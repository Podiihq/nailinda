defmodule NailindaWeb.DoctorController do
  use NailindaWeb, :controller
  alias Nailinda.User.Doctor
  alias Nailinda.User

  def new(conn, _params) do
    changeset = Doctor.changeset(%Doctor{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"doctor" => doctor_params}) do
    case User.create_doctor(doctor_params) do
      {:ok, _doctor_params} ->
        conn
        |> put_flash(:info, "successful")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
