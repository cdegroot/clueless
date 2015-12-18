defmodule Clueless.Repo.Migrations.CreateIdea do
  use Ecto.Migration

  def change do
    create table(:ideas) do
      add :summary, :string
      add :description, :string
      add :user_id, references(:users)

      timestamps
    end
    create index(:ideas, [:user_id])

  end
end
