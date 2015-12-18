defmodule Clueless.Idea do
  use Clueless.Web, :model

  schema "ideas" do
    field :summary, :string
    field :description, :string
    belongs_to :user, Clueless.User

    timestamps
  end

  @required_fields ~w(summary description)
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
