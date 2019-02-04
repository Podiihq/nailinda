defmodule NailindaWeb.Router do
  use NailindaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", NailindaWeb do
    pipe_through :browser

    get "/patient/new", PatientController, :new
    get "/", PageController, :index
    get "/patient/:id", PatientController, :edit
    put "/patient/:id", PatientController, :update
    post "/patient", PatientController, :create
    resources "/doctor", DoctorController
  end

  # Other scopes may use custom stacks.
  # scope "/api", NailindaWeb do
  #   pipe_through :api
  # end
end
