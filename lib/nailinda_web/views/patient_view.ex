defmodule NailindaWeb.PatientView do
  use NailindaWeb, :view

  alias Nailinda.Accounts.Patient

  def get_member(%Patient{location: name}) do
    [_h, _h2 | t] = String.split(name)

    t
    |> Enum.join(" ")
  end
end
