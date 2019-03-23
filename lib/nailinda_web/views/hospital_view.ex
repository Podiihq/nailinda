defmodule NailindaWeb.HospitalView do
  use NailindaWeb, :view

  alias Nailinda.Facilities.Hospital

  def get_member(%Hospital{location: name}) do
    name
    |> String.split()
    |> Enum.at(2)
  end
end
