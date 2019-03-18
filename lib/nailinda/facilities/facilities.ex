defmodule Nailinda.Facilities do
	@moduledoc """
		the facilities context
	"""

	alias Nailinda.Facilities.Hospital
	alias Nailinda.Repo

	def create_hospital(attrs) do
		%Hospital{}
		|> Hospital.changeset(attrs)
		|> Repo.insert()
	end
end