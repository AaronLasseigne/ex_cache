defmodule ExCacheTest do
  use ExUnit.Case

  test "read" do
    assert ExCache.read(:a) == :error

    ExCache.write(:a, 1)
    assert ExCache.read(:a) == {:ok, 1}
  end

  test "write" do
    assert ExCache.write(:a, 1) == :ok
  end
end
