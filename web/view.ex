defmodule OAuth2Example.View do
  use Phoenix.View, root: "web/templates"

  # The quoted expression returned by this block is applied
  # to this module and all other views that use this module.
  using do
    quote do
      # Import common functionality
      import OAuth2Example.I18n
      import OAuth2Example.Router.Helpers
      # Use Phoenix.HTML to import all HTML functions (forms, tags, etc)
      use Phoenix.HTML

      # Common aliases
      alias Phoenix.Controller.Flash
      alias OAuth2Example.User
    end
  end

  # Functions defined here are available to all other views/templates
end