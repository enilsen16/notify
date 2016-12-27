defmodule Notifier.Name do
  use Ecto.Schema
  import Ecto.Changeset

  schema "name" do
    field :first_name, :string
    field :last_name, :string
    field :dob, :date

    timestamps()
  end

  @fields [:first_name, :last_name, :dob]

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @fields)
  end
end
