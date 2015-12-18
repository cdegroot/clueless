defmodule Clueless.IdeaTagControllerTest do
  use Clueless.ConnCase

  alias Clueless.IdeaTag
  @valid_attrs %{}
  @invalid_attrs %{}

  setup do
    conn = authenticated_conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, idea_tag_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing ideas tags"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, idea_tag_path(conn, :new)
    assert html_response(conn, 200) =~ "New idea tag"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, idea_tag_path(conn, :create), idea_tag: @valid_attrs
    assert redirected_to(conn) == idea_tag_path(conn, :index)
    assert Repo.get_by(IdeaTag, @valid_attrs)
  end

  test "shows chosen resource", %{conn: conn} do
    idea_tag = Repo.insert! %IdeaTag{}
    conn = get conn, idea_tag_path(conn, :show, idea_tag)
    assert html_response(conn, 200) =~ "Show idea tag"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, idea_tag_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    idea_tag = Repo.insert! %IdeaTag{}
    conn = get conn, idea_tag_path(conn, :edit, idea_tag)
    assert html_response(conn, 200) =~ "Edit idea tag"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    idea_tag = Repo.insert! %IdeaTag{}
    conn = put conn, idea_tag_path(conn, :update, idea_tag), idea_tag: @valid_attrs
    assert redirected_to(conn) == idea_tag_path(conn, :show, idea_tag)
    assert Repo.get_by(IdeaTag, @valid_attrs)
  end

  test "deletes chosen resource", %{conn: conn} do
    idea_tag = Repo.insert! %IdeaTag{}
    conn = delete conn, idea_tag_path(conn, :delete, idea_tag)
    assert redirected_to(conn) == idea_tag_path(conn, :index)
    refute Repo.get(IdeaTag, idea_tag.id)
  end
end
