defmodule NailindaWeb.PatientController do
	use NailindaWeb, :controller
    alias Nailinda.User.Patient
    alias Nailinda.User

	 def new(conn, _params) do
	 changeset = Patient.changeset(%Patient{}, %{})
	 render(conn, "new.html", changeset: changeset)	
	 end

	 def create(conn, %{"patient" => patient_params}) do
	 	{:ok, patient} = User.create_user(patient_params)
	 	conn
	 	|>  put_flash(:info, "#{patient.first_name}  created successfuly")
	 	|>  redirect(to: "/")
	 end
end