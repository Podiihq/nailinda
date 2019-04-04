defmodule NailindaWeb.Router do
  use NailindaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phauxth.Authenticate
    plug Phauxth.Remember, create_session_func: &NailindaWeb.Auth.Utils.create_session/1
  end

  scope "/", NailindaWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/about", PageController, :about
    resources "/patient", PatientController
    get "/patient-locations", PatientController, :locations
    resources "/doctor", DoctorController
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/hospital", HospitalController
    resources "/roles", RoleController
    resources "/admins", AdminController
  end
end
