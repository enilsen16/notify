defmodule Notifier.Name do
  use Ecto.Schema

  schema "name" do
    field :first_name, :string
    field :last_name, :string
    field :dob, :naive_datetime

    timestamps()
  end

  @fields ~w(first_name, last_name, dob)

  def changeset(struct, params // %{}) do
    struct
    |> cast(params, @fields)
  end
end
