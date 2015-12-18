defmodule Clueless.IdeaTest do
  use Clueless.ModelCase

  alias Clueless.Idea

  @valid_attrs %{description: "some content", summary: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Idea.changeset(%Idea{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Idea.changeset(%Idea{}, @invalid_attrs)
    refute changeset.valid?
  end
end
