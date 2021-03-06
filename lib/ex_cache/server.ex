defmodule ExCache.Server do
  use GenServer.Behaviour

  def start_link(dict) do
    :gen_server.start_link({:local, :ex_cache}, __MODULE__, dict, [])
  end

  def init(dict) do
    {:ok, dict}
  end

  def handle_call({:read, key}, _from, dict) do
    {:reply, HashDict.fetch(dict, key), dict}
  end

  def handle_cast({:write, key, value}, dict) do
    {:noreply, HashDict.put(dict, key, value)}
  end

  def handle_call({:exist?, key}, _from, dict) do
    {:reply, HashDict.has_key?(dict, key), dict}
  end

  def handle_cast({:delete, key}, dict) do
    {:noreply, HashDict.delete(dict, key)}
  end
end
