defmodule Notifier.Repo.Migrations.AddNameTable do
  use Ecto.Migration

  def change do
    create table(:name) do
      add :first_name, :string
      add :last_name, :string
      add :dob, :date

      timestamps()
    end
  end
end
