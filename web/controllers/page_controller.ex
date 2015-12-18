defmodule Clueless.PageController do
  use Clueless.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
