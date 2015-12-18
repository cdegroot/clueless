defmodule Clueless.Router do
  use Clueless.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_user
  end

  pipeline :authenticated_only do
    plug :is_authenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Clueless do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    scope "/app" do
      pipe_through :is_authenticated

      resources "/users", UserController
      resources "/tags", TagController
      resources "/ideas", IdeaController
      resources "/ideas_tags", IdeaTagController
      resources "/comments", CommentController
      resources "/votes", VoteController
    end
  end


  scope "/api", Clueless do
    pipe_through :api
  end

  scope "/auth", Clueless do
    pipe_through :browser

    get "/:provider", AuthController, :index
    get "/:provider/callback", AuthController, :callback
    delete "/logout", AuthController, :delete
  end

  # Fetch the current user from the session and add it to `conn.assigns`. This
  # will allow you to have access to the current user in your views with
  # `@current_user`.
  defp assign_current_user(conn, _) do
    assign(conn, :current_user, get_session(conn, :current_user))
  end

  # Returns true if we have a user.
  defp is_authenticated(conn, _) do
    user = case Mix.env do
          :test -> conn.private[:test_user]
          _     -> get_session(conn, :current_user)
    end
    if is_nil(user) do
        conn |> redirect(to: "/")
    else
        conn
    end
  end
end
