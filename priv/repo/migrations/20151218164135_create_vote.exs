defmodule Clueless.Repo.Migrations.CreateVote do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add :user_id, references(:users)
      add :idea_id, references(:ideas)

      timestamps
    end
    create index(:votes, [:user_id])
    create index(:votes, [:idea_id])

  end
end
