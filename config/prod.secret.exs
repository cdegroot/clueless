use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :clueless, Clueless.Endpoint,
  secret_key_base: "35ba29b577b6a5f89aca65f5292ddaadb5a218c127a0cf9516579990df1a05e02df6c028c70a5170b839d3406579742fffcdc6e6897456b745bce53c8b7ccd68"

# Configure your database
config :clueless, Clueless.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "clueless_prod",
  pool_size: 20
