defmodule Nailinda.HospitalTest do
  use Nailinda.DataCase
  alias Nailinda.Facilities
  alias Nailinda.Facilities.Hospital

  setup do
    valid_attributes = %{
      hospital_name: "MyHospital",
      number_of_beds: 34,
      classification: "private",
      number_of_doctors: 50,
      location: "Kondele"
    }

    invalid = %{
      hospital_name: 5000,
      number_of_beds: "thirty",
      classification: "private",
      number_of_doctors: 50,
      location: "Kondele"
    }

    [valid_attributes: valid_attributes, invalid: invalid]
  end

  describe "Hospital" do
    test "hospital is created successfully", %{valid_attributes: valid_attributes} do
      {:ok, %Hospital{hospital_name: name}} = Facilities.create_hospital(valid_attributes)

      assert name == "MyHospital"
    end

    test "unsuccessful creation with invalid attributes", %{invalid: invalid} do
      assert {:error, %Ecto.Changeset{}} = Facilities.create_hospital(invalid)
    end
  end
end
