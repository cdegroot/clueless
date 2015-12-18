defmodule Clueless.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :comment, :string
      add :user_id, references(:users)
      add :idea_id, references(:ideas)

      timestamps
    end
    create index(:comments, [:user_id])
    create index(:comments, [:idea_id])

  end
end
