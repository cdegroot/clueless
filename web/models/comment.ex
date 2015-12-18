defmodule Clueless.Comment do
  use Clueless.Web, :model

  schema "comments" do
    field :comment, :string
    belongs_to :user, Clueless.User
    belongs_to :idea, Clueless.Idea

    timestamps
  end

  @required_fields ~w(comment)
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
