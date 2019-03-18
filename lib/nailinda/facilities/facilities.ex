defmodule Nailinda.Facilities do
	@moduledoc """
		the facilities context
	"""

	alias Nailinda.Facilities.Hospital
	alias Nailinda.Repo

	@doc """
	creates hospital
	"""
	def create_hospital(attrs) do
		%Hospital{}
		|> Hospital.changeset(attrs)
		|> Repo.insert()
	end
	@doc """
	get hospital details using the hospital id
	"""
	def get_hospital_by_id(id) do
		Hospital
		|> Repo.get(id)
	end

	@doc """
	get all hospitals
	"""
	def get_all_hospitals do
		Hospital
		|> Repo.all
	end
end