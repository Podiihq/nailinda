defmodule NailindaWeb.PatientController do
  use NailindaWeb, :controller
  
  alias Nailinda.User

  def new(conn, _params) do
    alias Nailinda.User.Patient
    changeset = Patient.changeset(%Patient{}, %{})
    render(conn, "new.html", changeset: changeset)
  end 
      

	 def create(conn, %{"patient" => patient_params}) do
	 	case User.create_patient(patient_params) do  
	 	{:ok, %Patient{} = patient} ->
	 	conn
	 	|>  put_flash(:info, "#{patient.first_name}  created successfuly")
	 	|>  redirect(to: "/")


    {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end   
  end
  
   def show(conn, _params) do
      patients = User.get_patient
      render(conn, "show.html", patients: patients)
    end
end
