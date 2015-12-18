defmodule Clueless.VoteControllerTest do
  use Clueless.ConnCase

  alias Clueless.Vote
  @valid_attrs %{}
  @invalid_attrs %{}

  setup do
    conn = authenticated_conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, vote_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing votes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, vote_path(conn, :new)
    assert html_response(conn, 200) =~ "New vote"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, vote_path(conn, :create), vote: @valid_attrs
    assert redirected_to(conn) == vote_path(conn, :index)
    assert Repo.get_by(Vote, @valid_attrs)
  end

  test "shows chosen resource", %{conn: conn} do
    vote = Repo.insert! %Vote{}
    conn = get conn, vote_path(conn, :show, vote)
    assert html_response(conn, 200) =~ "Show vote"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, vote_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    vote = Repo.insert! %Vote{}
    conn = get conn, vote_path(conn, :edit, vote)
    assert html_response(conn, 200) =~ "Edit vote"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    vote = Repo.insert! %Vote{}
    conn = put conn, vote_path(conn, :update, vote), vote: @valid_attrs
    assert redirected_to(conn) == vote_path(conn, :show, vote)
    assert Repo.get_by(Vote, @valid_attrs)
  end

  test "deletes chosen resource", %{conn: conn} do
    vote = Repo.insert! %Vote{}
    conn = delete conn, vote_path(conn, :delete, vote)
    assert redirected_to(conn) == vote_path(conn, :index)
    refute Repo.get(Vote, vote.id)
  end
end
