defmodule Nailinda.IntegrationCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Nailinda.ConnCase
      use PhoenixIntegration
    end
  end
end
