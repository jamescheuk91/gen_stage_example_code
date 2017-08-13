defmodule GenStageExampleCode do
  use Application
  @moduledoc """
  Documentation for GenStageExampleCode.
  """


  def start() do
    import Supervisor.Spec, warn: false
    alias GenStageExampleCode.{A, B, C}

    # Define workers and child supervisors to be supervised
    children = [
      worker(A, [0]),
      worker(B, [2]),
      worker(C, [], id: "c_1"),
      worker(C, [], id: "c_2"),
      worker(C, [], id: "c_3"),
      worker(C, [], id: "c_4")
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GenStageExampleCode.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
