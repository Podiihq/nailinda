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
    post "/patient", PatientController, :create
    get "/patients", PatientController, :index
    get "/patient/:id", PatientController, :show
    delete "/patient/:id", PatientController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", NailindaWeb do
  #   pipe_through :api
  # end
end
