defmodule ExCache do
  use Application.Behaviour

  def start(_type, dict) do
    __MODULE__.Supervisor.start_link(dict)
  end

  def read(key) do
    :gen_server.call(:ex_cache, {:read, key})
  end

  def write(key, value) do
    :gen_server.call(:ex_cache, {:write, key, value})
  end

  def exist?(key) do
    :gen_server.call(:ex_cache, {:exist?, key})
  end
end
