defmodule ApplyTest do
  use ExUnit.Case
  doctest Apply

  test "compress aaabccccdd" do
    assert Apply.compress("aaabccccdd") === "a3bc4d2"
  end
  test "compress aaaaaffffffffffc" do
    assert Apply.compress("aaaaaffffffffffc") === "a5f10c"
  end
  test "compress abcd" do
    assert Apply.compress("abcd") === "abcd"
  end
  test "compress ccceee12eccceee" do
    assert Apply.compress("ccceee12eccceee") === "c3e4c3e3"
  end
  test "compress effeac01cb65c" do
    assert Apply.compress("effeac01cb65c") === "ef2eac2bc"
  end
  test "compress empty" do
    assert Apply.compress("") === ""
  end
  test "compress integer" do
    assert Apply.compress(1) === 1
  end
end
