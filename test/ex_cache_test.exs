defmodule ExCacheTest do
  use ExUnit.Case

  test "read" do
    assert ExCache.read(:r) == :error

    ExCache.write(:r, 1)
    assert ExCache.read(:r) == {:ok, 1}
  end

  test "write" do
    assert ExCache.write(:w, 1) == :ok
  end

  test "exist?" do
    refute ExCache.exist?(:e)

    ExCache.write(:e, 1)
    assert ExCache.exist?(:e)
  end
end
