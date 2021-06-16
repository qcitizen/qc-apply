defmodule CompressionTest do
  use ExUnit.Case

  describe "compress string" do
    test "all base cases" do
      assert Compression.compress("aaabccccdd") == "a3bc4d2"
      assert Compression.compress("aaaaaffffffffffc") == "a5f10c"
      assert Compression.compress("abcd") == "abcd"
      assert Compression.compress("ccceee12eccceee") == "c3e4c3e3"
      assert Compression.compress("effeac01cb65c") == "ef2eac2bc"
      assert Compression.compress("") == ""
      assert Compression.compress(nil) == ""
    end
  end
end
