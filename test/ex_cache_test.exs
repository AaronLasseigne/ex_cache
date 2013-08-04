defmodule ExCacheTest do
  use ExUnit.Case

  test "read(key)" do
    assert ExCache.read(:r) == :error

    ExCache.write(:r, 1)
    assert ExCache.read(:r) == {:ok, 1}
  end

  test "write(key, value)" do
    assert ExCache.write(:w, 1) == :ok
    assert ExCache.read(:w) == {:ok, 1}
  end

  test "exist?(key)" do
    refute ExCache.exist?(:e)

    ExCache.write(:e, 1)
    assert ExCache.exist?(:e)
  end

  test "delete(key)" do
    assert ExCache.delete(:d1) == :error

    ExCache.write(:d2, 1)
    assert ExCache.delete(:d2) == :ok
    assert ExCache.read(:d2) == :error
  end

  test "fetch(key, value) when is_function(value)" do
    assert ExCache.fetch(:ff, fn -> 1 + 1 end) == 2

    ExCache.write(:ff, 1)
    assert ExCache.fetch(:ff, fn -> 1 + 1 end) == 1
  end

  test "fetch(key, value)" do
    assert ExCache.fetch(:fv, 2) == 2

    ExCache.write(:fv, 1)
    assert ExCache.fetch(:fv, 2) == 1
  end
end
