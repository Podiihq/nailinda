defmodule Nailinda.IntegrationCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      use Nailinda.ConnCase
      use PhoenixIntegration
    end
  end
end
