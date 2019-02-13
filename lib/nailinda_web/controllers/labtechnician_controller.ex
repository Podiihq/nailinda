defmodule NailindaWeb.LabtechnicianController do
    use NailindaWeb, :controller
  
    alias Nailinda.User
    alias Nailinda.User.Labtechnician
  
    def new(conn, _params) do
      changeset = Labtechnician.changeset(%Labtechnician{}, %{})
      render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"labtechnician" => labtechnician_params}) do
        case User.create_labtechnician(labtechnician_params) do
            {:ok, %Labtechnician{} = labtechnician} ->
                  conn
                  |>  put_flash(:info, "#{labtechnician.first_name}  created successfuly")
                  |>  redirect(to: "/")
  
            {:error, %Ecto.Changeset{} = changeset} ->
              render(conn, "new.html", changeset: changeset)
    end
        end
end