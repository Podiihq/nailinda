defmodule NailindaWeb.HospitalView do
  use NailindaWeb, :view

  alias Nailinda.Facilities.Hospital

  def get_member(%Hospital{location: name}) do
    hospital_name =
      name
      |> String.split()
      |> Enum.split(2)

    {location_coordinates, location_name} = hospital_name

    location_name
    |> Enum.join(" ")
  end
end
