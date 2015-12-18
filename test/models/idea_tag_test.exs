defmodule Clueless.IdeaTagTest do
  use Clueless.ModelCase

  alias Clueless.IdeaTag

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = IdeaTag.changeset(%IdeaTag{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = IdeaTag.changeset(%IdeaTag{}, @invalid_attrs)
    refute changeset.valid?
  end
end
