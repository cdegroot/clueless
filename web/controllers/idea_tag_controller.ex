defmodule Clueless.IdeaTagController do
  use Clueless.Web, :controller

  alias Clueless.IdeaTag

  plug :scrub_params, "idea_tag" when action in [:create, :update]

  def index(conn, _params) do
    ideas_tags = Repo.all(IdeaTag)
    render(conn, "index.html", ideas_tags: ideas_tags)
  end

  def new(conn, _params) do
    changeset = IdeaTag.changeset(%IdeaTag{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"idea_tag" => idea_tag_params}) do
    changeset = IdeaTag.changeset(%IdeaTag{}, idea_tag_params)

    case Repo.insert(changeset) do
      {:ok, _idea_tag} ->
        conn
        |> put_flash(:info, "Idea tag created successfully.")
        |> redirect(to: idea_tag_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    idea_tag = Repo.get!(IdeaTag, id)
    render(conn, "show.html", idea_tag: idea_tag)
  end

  def edit(conn, %{"id" => id}) do
    idea_tag = Repo.get!(IdeaTag, id)
    changeset = IdeaTag.changeset(idea_tag)
    render(conn, "edit.html", idea_tag: idea_tag, changeset: changeset)
  end

  def update(conn, %{"id" => id, "idea_tag" => idea_tag_params}) do
    idea_tag = Repo.get!(IdeaTag, id)
    changeset = IdeaTag.changeset(idea_tag, idea_tag_params)

    case Repo.update(changeset) do
      {:ok, idea_tag} ->
        conn
        |> put_flash(:info, "Idea tag updated successfully.")
        |> redirect(to: idea_tag_path(conn, :show, idea_tag))
      {:error, changeset} ->
        render(conn, "edit.html", idea_tag: idea_tag, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    idea_tag = Repo.get!(IdeaTag, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(idea_tag)

    conn
    |> put_flash(:info, "Idea tag deleted successfully.")
    |> redirect(to: idea_tag_path(conn, :index))
  end
end
