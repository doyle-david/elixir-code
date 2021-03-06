defmodule Sequence do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Sequence.Worker, [arg1, arg2, arg3]),
      worker(Sequence.Server, [123]),
      worker(Stack.Server, [[123, "ten", :atom]])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sequence.Supervisor]

    # Start a Supervisor with the given children and options
    Supervisor.start_link(children, opts)
  end
end
