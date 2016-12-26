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

  def new_name() do
    first_name = Faker.Name.first_name()
    last_name = Faker.Name.last_name()
    dob = Faker.Date.date_of_birth()

    %{"first_name" => first_name, "last_name" => last_name, "dob" => dob}
  end

  def save_to_db(%{"first_name" => first_name, "last_name" => last_name, "dob" => dob}) do

  end
end
