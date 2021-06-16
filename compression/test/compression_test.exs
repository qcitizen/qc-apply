defmodule CompressionTest do
  use ExUnit.Case
  doctest Compression

  test "greets the world" do
    assert Compression.hello() == :world
  end
end
