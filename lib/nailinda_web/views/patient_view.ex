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
    role = Repo.get_by!(Role, %{role: "patient"})
   [{role.role, role.id}]
  end
end
