defmodule NailindaWeb.AdminControllerTest do
  use NailindaWeb.ConnCase

  alias Nailinda.Admins

  @create_attrs %{
    email: "some email",
    phone_number: "some phone_number",
    username: "some username"
  }
  @update_attrs %{
    email: "some updated email",
    phone_number: "some updated phone_number",
    username: "some updated username"
  }
  @invalid_attrs %{email: nil, phone_number: nil, username: nil}

  def fixture(:admin) do
    {:ok, admin} = Admins.create_admin(@create_attrs)
    admin
  end

  describe "index" do
    test "lists all admins", %{conn: conn} do
      conn = get(conn, Routes.admin_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Admins"
    end
  end

  describe "new admin" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.admin_path(conn, :new))
      assert html_response(conn, 200) =~ "New Admin"
    end
  end

  describe "create admin" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.admin_path(conn, :create), admin: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.admin_path(conn, :show, id)

      conn = get(conn, Routes.admin_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Admin"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.admin_path(conn, :create), admin: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Admin"
    end
  end

  describe "edit admin" do
    setup [:create_admin]

    test "renders form for editing chosen admin", %{conn: conn, admin: admin} do
      conn = get(conn, Routes.admin_path(conn, :edit, admin))
      assert html_response(conn, 200) =~ "Edit"
    end
  end

  describe "update admin" do
    setup [:create_admin]

    test "redirects when data is valid", %{conn: conn, admin: admin} do
      conn = put(conn, Routes.admin_path(conn, :update, admin), admin: @update_attrs)
      assert redirected_to(conn) == Routes.admin_path(conn, :show, admin)

      conn = get(conn, Routes.admin_path(conn, :show, admin))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, admin: admin} do
      conn = put(conn, Routes.admin_path(conn, :update, admin), admin: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit"
    end
  end

  describe "delete admin" do
    setup [:create_admin]

    test "deletes chosen admin", %{conn: conn, admin: admin} do
      conn = delete(conn, Routes.admin_path(conn, :delete, admin))
      assert redirected_to(conn) == Routes.admin_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.admin_path(conn, :show, admin))
      end
    end
  end

  defp create_admin(_) do
    admin = fixture(:admin)
    {:ok, admin: admin}
  end
end
