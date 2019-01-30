defmodule NailindaWeb.PatientController do
	use NailindaWeb, :controller
    alias Nailinda.User.Patient
    alias Nailinda.User

	 def new(conn, _params) do
	 changeset = Patient.changeset(%Patient{}, %{})
	 render(conn, "new.html", changeset: changeset)	
	 end

	 def create(conn, %{"patient" => patient_params}) do
	 	case User.create_patient(patient_params) do  
	 	{:ok, %Patient{} = patient} ->
	 	conn
	 	|>  put_flash(:info, "#{patient.first_name}  created successfuly")
	 	|>  redirect(to: Routes.patient_path(conn, :new))

    {:error, %Ecto.Changeset{} = changeset} ->
      render(conn, "new.html", changeset: changeset)
	 end
  end
end