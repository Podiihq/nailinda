defmodule Nailinda.UserTest do
  use Nailinda.DataCase

  alias Nailinda.User
   setup do
    valid_attrs =  %{
      first_name: "jackline",
      last_name: "kaunda",
      date_of_birth: ~D[2019-01-28],
      location: "Kisumu",
      id_number: 4_576_890,
      phone_number: "079056431",
      next_of_kin: "wayua"
    }
    {:ok,  patient} = User.create_patient(valid_attrs)
     [patient: patient]
      
   end
  describe "patients" do

      test "creates user with valid data",%{patient: patient}  do
      assert patient.first_name == "jackline"
      assert patient.last_name == "kaunda"
      assert patient.date_of_birth == ~D[2019-01-28]
      assert patient.location == "Kisumu"
      assert patient.id_number == 4_576_890
      assert patient.phone_number == "079056431"
      assert patient.next_of_kin == "wayua"
      end

    test "create user with invalid data to return a error" do 
     assert {:error, %Ecto.Changeset{}} = User.create_patient(%{})
    end 

    test "list of all patients created", %{patient: patient} do
     assert User.get_all_patients() == [patient]
    end
     test "get a patient using there id", %{patient: patient} do
      assert User.get_patient_by_id(patient.id) == patient
     end

  end
end
