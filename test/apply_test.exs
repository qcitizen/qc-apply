defmodule ApplyTest do
  use ExUnit.Case
  doctest Apply

  test "greets the world" do
    assert Apply.hello() == :world
  end
end
