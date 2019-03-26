defmodule Nailinda.Redis do
  @moduledoc """
   This is for communication with Redis
  """
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    start_redis()
    {:ok, %{}}
  end

  def start_redis do
    {:ok, conn} = Redix.start_link("redis://redis:6379", port: 6379)
    conn
  end

  def save_patient_location(long, lat, member) do
    start_redis()
    |> Redix.command(["GEOADD", "patient_location", long, lat, member])
  end

  def show_all_patients do
    start_redis()
    |> Redix.command(["ZRANGE", "patient_location", 0, -1])
  end
end
