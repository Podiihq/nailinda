defmodule Nailinda.User do
	@moduledoc """
	This is the users context
	"""
	alias Nailinda.Repo
	alias Nailinda.User.Patient
	alias Nailinda.User.Doctor
	def create_patient(attrs) do
    	%Patient{}
    	|>Patient.changeset(attrs)
    	|> Repo.insert()
<<<<<<< HEAD
	end
	def get_patient_by_id(id) do
		Repo.get(Patient, id)
	end
	def update_patient(patient, attrs) do
		patient
		|> Patient.changeset(attrs)
		|> Repo.update()
	end

	def create_doctor(attrs) do
		%Doctor{}
		|> Doctor.changeset(attrs)
		|>Repo.insert()
	end
=======
    end
    def get_all_patients do
        Patient
    	|> Repo.all
    end

    def get_patient_by_id(id) do
         Repo.get(Patient, id)
     end
>>>>>>> ffc74963cb30b89f80b55556311f04ca67ddb822
end
