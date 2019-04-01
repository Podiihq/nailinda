defmodule NailindaTest.Integration.CreateAdmin do
  use Nailinda.IntegrationCase

  test "create admin successfully", %{conn: conn} do
    conn
    |> get(Routes.admin_path(conn, :new))
    |> follow_form(
      admin: %{username: "admin", email: "admin@admin.com", phone_number: "0712345678"}
    )
    |> assert_response(html: "successfully")
  end
end
