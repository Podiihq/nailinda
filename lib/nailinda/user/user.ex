defmodule Nailinda.User do
	@moduledoc """
	This is the users context
	"""
	alias Nailinda.Repo
	alias Nailinda.User.Patient
    alias Nailinda.User.Location
    
	def create_patient(attrs) do
    	%Patient{}
    	|>Patient.changeset(attrs)
    	|> Repo.insert()
    end
    def get_all_patients do
        Patient
    	|> Repo.all
    end

    def get_patient_by_id(id) do
         Repo.get(Patient, id)
     end

    def create_new_location(location) do
        %Location{}
        |> Location.changeset(%{location: location})
        |> Repo.insert()
        
        Redis.geoadd(location)
    end
end
