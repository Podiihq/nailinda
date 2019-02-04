defmodule Nailinda.UserTest do
  use Nailinda.DataCase

  alias Nailinda.User
  alias Nailinda.User.Patient
  describe "patients" do
    
   @valid_attrs %{
      first_name: "jackline",
      last_name: "kaunda",
      date_of_birth: ~D[2019-01-28],
      location: "Kisumu",
      id_number: 4_576_890,
      phone_number: 079_056_431,
      next_of_kin: "wayua"
    }
   @invalid_attrs %{
      first_name: nil,
      last_name: nil,
      date_of_birth: nil,
      location: nil,
      id_number: nil,
      phone_number: nil,
      next_of_kin: nil
    }

    test "creates user with valid data " do
      assert{:ok, %Patient{} = patient} = User.create_patient(@valid_attrs)
      assert patient.first_name == "jackline"
      assert patient.last_name == "kaunda"
      assert patient.date_of_birth == ~D[2019-01-28]
      assert patient.location == "Kisumu"
      assert patient.id_number == 4_576_890
      assert patient.phone_number == 079_056_431
      assert patient.next_of_kin == "wayua"
    end
    test "create user with invalid data to return a error" do 
     assert {:error, %Ecto.Changeset{}} = User.create_patient(@invalid_attrs)
    end
  end
end
