defmodule Notifier do
  import Notifier.Generator
  @moduledoc """
  Documentation for Notifier.
  """

  def seed_db() do
    new_name()
    |> save_to_db
  end
end
