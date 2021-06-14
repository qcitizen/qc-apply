defmodule CompressorTest do
  use ExUnit.Case
  doctest Compressor

  test "Example 1" do
    assert Compressor.compress("aaabccccdd") == "a3bc4d2"
  end

  test "Example 2" do
    assert Compressor.compress("aaaaaffffffffffc") == "a5f10c"
  end

  test "Example 3" do
    assert Compressor.compress("abcd") == "abcd"
  end

  test "Example 4" do
    assert Compressor.compress("ccceee12eccceee") == "c3e4c3e3"
  end

  test "Example 5" do
    assert Compressor.compress("effeac01cb65c") == "ef2eac2bc"
  end

  test "Edge case 1 - Empty string" do
    assert Compressor.compress("") == ""
  end

  test "Edge case 2 - All numbers" do
    assert Compressor.compress("12345667890") == ""
  end
end
