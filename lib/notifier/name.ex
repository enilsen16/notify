defmodule Notifier.Name do
  use Ecto.Schema

  schema "name" do
    field :first_name, :string
    field :last_name, :string
    field :dob, :naive_datetime

    timestamps()
  end
end
