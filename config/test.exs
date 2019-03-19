use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :nailinda, NailindaWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :nailinda, Nailinda.Repo,
  username: "postgres",
  password: "postgres",
  database: "nailinda_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :phoenix_integration,
  endpoint: NailindaWeb.Endpoint

# Password hashing test config
config :argon2_elixir, t_cost: 1, m_cost: 8
# config :bcrypt_elixir, log_rounds: 4
# config :pbkdf2_elixir, rounds: 1
