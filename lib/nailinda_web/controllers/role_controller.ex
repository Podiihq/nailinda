defmodule NailindaWeb.RoleController do
  use NailindaWeb, :controller

  alias Nailinda.Accounts
  alias Nailinda.Accounts.Role

  def new(conn, _params) do
    changeset = Role.changeset(%Role{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"role" => %{"role" => role}}) do
    IO.inspect role
    case Accounts.create_role(role) do
      {:ok, %Role{}} ->
        conn
        |> put_flash(:info, "successfully created role!")
        |> redirect(to: "/")

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end
