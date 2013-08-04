defmodule ExCache do
  use Application.Behaviour

  def start(_type, dict) do
    __MODULE__.Supervisor.start_link(dict)
  end

  def read(key) do
    call({:read, key})
  end

  def write(key, value) do
    cast({:write, key, value})
    :ok
  end

  def exist?(key) do
    call({:exist?, key})
  end

  def delete(key) do
    if exist?(key) do
      cast({:delete, key})
      :ok
    else
      :error
    end
  end

  def fetch(key, value) when is_function(value) do
    fetch(key, value.())
  end
  def fetch(key, value) do
    if not exist?(key) do
      write(key, value)
    end

    elem read(key), 1
  end

  defp server, do: :ex_cache

  defp cast(args) do
    :gen_server.cast(server, args)
  end

  defp call(args) do
    :gen_server.call(server, args)
  end
end
