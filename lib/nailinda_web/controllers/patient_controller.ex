defmodule NailindaWeb.PatientController do
  use NailindaWeb, :controller
  
  alias Nailinda.User
  alias Nailinda.User.Patient

  def new(conn, _params) do
    
    changeset = Patient.changeset(%Patient{}, %{})
    render(conn, "new.html", changeset: changeset)
  end 
      

	 def create(conn, %{"patient" => patient_params}) do
	 	case User.create_patient(patient_params) do  
	 	{:ok, %Patient{} = patient} ->
	 	conn
	 	|>  put_flash(:info, "#{patient.first_name}  created successfuly")
	 	|>  redirect(to: "/patients")


    {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end   
  end

  def index(conn, _params) do
      patients = User.get_all_patients
      render(conn, "index.html", patients: patients)
    end

  def show(conn, %{"id" => id}) do
      patient= User.get_patient_by_id(id)
      render(conn, "show.html", patient: patient)
  end
end
