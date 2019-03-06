defmodule Nailinda.Redis do
  @moduledoc """
   GenServer for starting the Redix application and saving
   the locations of every user to the Redis db
  """
  use GenServer

  def start_link(conn \\ []) do
    GenServer.start_link(__MODULE__, :ok, conn)
  end

  def init(conn) do
    start_redis_server()
    {:ok, conn}
  end

  def start_redis_server do
   {:ok, conn} = Redix.start_link(host: "redis", port: 6379)
   conn
  end

  def save_user(long, lat, member) do
    {:ok, conn} = Redix.start_link(host: "redis", port: 6379)
   Redix.command(conn, ["GEOADD", "Position", long, lat, member])
  end
end
