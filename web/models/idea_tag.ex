defmodule Clueless.IdeaTag do
  use Clueless.Web, :model

  schema "ideas_tags" do
    belongs_to :idea, Clueless.Idea
    belongs_to :tag, Clueless.Tag

    timestamps
  end

  @required_fields ~w()
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
