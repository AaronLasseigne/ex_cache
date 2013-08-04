# ExCache

A playful attempt to implement something like Memcached in Elixir.

```elixir
ExCache.read(:a) # => :error

ExCache.write(:a, 1) # => :ok

ExCache.read(:a) # => {:ok, 1}

ExCache.exist?(:a) # => true

ExCache.delete(:a) # => :ok

ExCache.fetch :a, fn ->
  1 + 1
end
# => 2
```
