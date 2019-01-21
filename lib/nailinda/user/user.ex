defmodule Nailinda.User do
	@moduledoc """
	This is the users context
	"""
	alias Nailinda.Repo
	alias Nailinda.User.Patient
	def create_user(attrs) do
    	%Patient{}
    	|>Patient.changeset(attrs)
    	|> Repo.insert()
    end
end
