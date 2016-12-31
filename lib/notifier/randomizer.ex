defmodule Notifier.Randomizer do
	@moduledoc """
		Using a genserver recursively call and add new faker data
	"""
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    Process.send_after(self(), :work, 1000)
    {:ok, state}
  end

  def handle_info(:work, state) do
    Process.send_after(self(), :work, 1000)
    {:noreply, state}
  end

  #TODO: Add function to randomly timeout :)
end
