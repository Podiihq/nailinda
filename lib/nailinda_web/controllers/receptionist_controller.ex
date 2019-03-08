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
end
