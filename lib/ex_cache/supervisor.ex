defmodule ExCache.Supervisor do
  use Supervisor.Behaviour

  def start_link(dict) do
    :supervisor.start_link(__MODULE__, dict)
  end

  def init(dict) do
    children = [worker(ExCache.Server, [dict])]

    supervise children, strategy: :one_for_one
  end
end
