defmodule Nailinda.User do
	@moduledoc """
	This is the users context
	"""
	alias Nailinda.Repo
	alias Nailinda.User.Patient
	def create_patient(attrs) do
    	%Patient{}
    	|>Patient.changeset(attrs)
    	|> Repo.insert()
	end
	def get_patient_by_id(id) do
		Repo.get(Patient, id)
	end
	def update_patient(patient, attrs) do
		patient
		|> Patient.changeset(attrs)
		|> Repo.update()
	end
end
