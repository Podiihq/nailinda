defmodule NailindaWeb.ReceptionistController do
  use NailindaWeb, :controller

  alias Nailinda.User
  alias Nailinda.User.Receptionist

  def new(conn, _params) do
    changeset = Receptionist.changeset(%Receptionist{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"receptionist" => receptionist_params}) do
    case User.create_receptionist(receptionist_params) do
      {:ok, %Receptionist{}} ->
        conn
        |> put_flash(:info, "Receptionist created successfuly")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def index(conn, _params) do
    receptionists = User.get_all_receptionist()
    render(conn, "index.html", receptionists: receptionists)
  end

  def show(conn, %{"id" => id}) do
    receptionist = User.get_receptionist_by_id(id)
    render(conn, "show.html", receptionist: receptionist)
  end
end
