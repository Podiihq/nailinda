defmodule Nailinda.UserTest do
  use Nailinda.DataCase

  alias Nailinda.Accounts
  alias Nailinda.Accounts.{Doctor, Patient}
  
  describe "users" do
    @valid_attrs %{
      first_name: "jackline",
      last_name: "kaunda",
      date_of_birth: ~D[2019-01-28],
      location: "Kisumu",
      id_number: 4_576_890,
      phone_number: "079056431",
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

    test "creates patient with valid data " do
      {:ok, role} = Accounts.create_role("police")
      assert {:ok, %Patient{} = patient} = Accounts.create_patient(Map.put(@valid_attrs, :role_id, role.id))
      assert patient.first_name == "jackline"
      assert patient.last_name == "kaunda"
      assert patient.date_of_birth == ~D[2019-01-28]
      assert patient.location == "Kisumu"
      assert patient.id_number == 4_576_890
      assert patient.phone_number == "079056431"
      assert patient.next_of_kin == "wayua"
    end

    test "create user with invalid data to return a error" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_patient(@invalid_attrs)
    end
  end

  describe "doctors" do
    @valid_attrs %{
      first_name: "okoth",
      middle_name: "kongo",
      surname: "kaunda",
      location: "Kisumu",
      department: "Paeditrician",
      speciality: "kids",
      email: "okothjacky@gmail.com",
      id_number: 4_576_890
    }
    @invalid_attrs %{
      first_name: nil,
      surname: nil,
      location: nil,
      id_number: nil,
      phone_number: nil,
      next_of_kin: nil
    }

    test "creates doctor with valid data " do
      {:ok, role} = Accounts.create_role("star")
      assert {:ok, %Doctor{} = doctor} = Accounts.create_doctor(Map.put(@valid_attrs, :role_id, role.id))
      assert doctor.first_name == "okoth"
      assert doctor.surname == "kaunda"
      assert doctor.location == "Kisumu"
      assert doctor.id_number == 4_576_890
    end

    test "create doctor with invalid data to return a error" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_doctor(@invalid_attrs)
    end
  end
end
