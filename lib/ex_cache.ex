defmodule ExCache do
  use Application.Behaviour

  def start(_type, dict) do
    __MODULE__.Supervisor.start_link(dict)
  end

  def read(key) do
    call({:read, key})
  end

  def write(key, value) do
    call({:write, key, value})
  end

  def exist?(key) do
    call({:exist?, key})
  end

  defp call(args) do
    :gen_server.call(:ex_cache, args)
  end
end
