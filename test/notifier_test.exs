defmodule NotifierTest do
  use ExUnit.Case
  import Ecto.Query
  import Notifier.Generator

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Notifier.Repo)
  end

  test "deletes then saves to db" do
    {count, nil} = clear_table(Notifier.Name)

    new_name |> save_to_db()
    assert 1 == Notifier.Repo.one(from n in Notifier.Name, select: count("*"))
  end
end
