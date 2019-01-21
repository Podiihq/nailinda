defmodule NailindaWeb.PatientController do
	use NailindaWeb, :controller
    alias Nailinda.User.Patient

	 def new(conn, _params) do
	 changeset = Patient.changeset(%Patient{}, %{})
	 render(conn, "new.html", changeset: changeset)	
	 end
end