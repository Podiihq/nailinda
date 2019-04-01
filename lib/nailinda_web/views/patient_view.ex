defmodule NailindaWeb.PatientView do
  use NailindaWeb, :view

  alias Nailinda.Accounts.{Patient, Role}
  alias Nailinda.Repo

  def get_member(%Patient{location: name}) do
    [_h, _h2 | t] = String.split(name)

    t
    |> Enum.join(" ")
  end
  
  def roles() do
    roles = Repo.all(Role)
    Enum.map(roles, &{&1.role, &1.id})
  end

  # def role_id() do
  #   role = Repo.get_by(Role, %{role: "patient"})
  #   role.id
  # end
end
