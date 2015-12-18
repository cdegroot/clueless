defmodule Clueless.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  imports other functionality to make it easier
  to build and query models.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      # Import conveniences for testing with connections
      use Phoenix.ConnTest

      alias Clueless.Repo
      import Ecto.Model
      import Ecto.Query, only: [from: 2]

      import Clueless.Router.Helpers

      def authenticated_conn do
        conn() |> put_private(:test_user, %{email: "foo@bar.com"})
      end

      # The default endpoint for testing
      @endpoint Clueless.Endpoint
    end
  end

  setup tags do
    unless tags[:async] do
      Ecto.Adapters.SQL.restart_test_transaction(Clueless.Repo, [])
    end

    :ok
  end

end
