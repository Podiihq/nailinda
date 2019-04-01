defmodule Nailinda.IntegrationCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      alias NailindaWeb.Router.Helpers, as: Routes
      use NailindaWeb.ConnCase
      use PhoenixIntegration
    end
  end
end
