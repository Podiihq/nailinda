defmodule NailindaWeb.DoctorControllerTest do
  use NailindaWeb.ConnCase
  alias Nailinda.Accounts

  test "show a doctors details if found", %{conn: conn} do
    {:ok, doctor} =
      Accounts.create_doctor(%{
        first_name: "okoth",
        middle_name: "kongo",
        surname: "kaunda",
        location: "Kisumu",
        department: "Paeditrician",
        speciality: "kids",
        email: "jacky@gmail.com",
        id_number: 4_576_890
      })

    get(conn, Routes.doctor_path(conn, :show, doctor.id))

    expected = %{
      "data" => %{
        "id" => doctor.id,
        "first_name" => doctor.first_name,
        "middle_name" => doctor.middle_name,
        "surname" => doctor.surname,
        "location" => doctor.location
      }
    }

    assert conn = expected
  end
end
