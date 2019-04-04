defmodule NailindaWeb.DoctorView do
  use NailindaWeb, :view

  alias Nailinda.Accounts.Role
  alias Nailinda.Repo

  def roles do
    role = Repo.get_by!(Role, %{role: "doctor"})
    [{role.role, role.id}]
  end
end
