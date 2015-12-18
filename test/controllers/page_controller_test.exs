defmodule Clueless.PageControllerTest do
  use Clueless.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Sign in with Google"
  end
end
