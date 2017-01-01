defmodule Notifier.Listen do
   import Postgrex
   use GenServer

   @pg_conf [
    database: "notifier",
    username: "postgres",
    password: "postgres",
    hostname: "localhost",
    port: 5432
   ]

  def start_link() do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    {:ok, pid} = Postgrex.Notifications.start_link(@pg_conf ++ [name: :notifications])
    {:ok, ref} = Postgrex.Notifications.listen(pid, "virtual")
    {:ok, {pid, "notifier", ref}}
  end

  def handle_info(event, state) do
    case event do
      {:notification, pid, ref, channel, payload} ->
        IO.inspect "Notification recieved with #{payload}"
      _ ->
        IO.inspect "something"
    end
    {:noreply, state}
  end
end
# TODO: Connect to postgrex through channel
