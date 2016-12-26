defmodule Notifier.Generator do
  @moduledoc """
    Generates fake data from faker and then saves to the db in a continous stream.
  """

  @doc"""
    Clears a given table
  """
  def clear_table(table_name) do
    Name.Repo.delete(table_name)
  end
end
