defmodule Clueless.Repo.Migrations.CreateIdeaTag do
  use Ecto.Migration

  def change do
    create table(:ideas_tags) do
      add :idea_id, references(:ideas)
      add :tag_id, references(:tags)

      timestamps
    end
    create index(:ideas_tags, [:idea_id])
    create index(:ideas_tags, [:tag_id])

  end
end
