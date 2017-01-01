defmodule Notifier.Randomizer do
	@moduledoc """
		Using a genserver recursively call and add new faker data
	"""
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    # Notifier.Generator.clear_table(Notifier.Name)
    Process.send_after(self(), :work, generate_number())
    {:ok, state}
  end

  def handle_info(:work, state) do
    Notifier.seed_db()
    Process.send_after(self(), :work, generate_number())
    {:noreply, state}
  end

  defp generate_number() do
    :rand.uniform() * 1000 |> trunc()
  end
end
