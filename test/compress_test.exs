defmodule CompressTest do
  use ExUnit.Case
  doctest Compress

  test "compresses aaabccccdd to a3bc4d2" do
    assert Compress.compress("aaabccccdd") == "a3bc4d2"
  end

  test "aaaaaffffffffffc to a5f10c" do
    assert Compress.compress("aaaaaffffffffffc") == "a5f10c"
  end

  test "compresses abcd to abcd" do
    assert Compress.compress("abcd") == "abcd"
  end

  test "compresses ccceee12eccceee to c3e4c3e3" do
    assert Compress.compress("ccceee12eccceee") == "c3e4c3e3"
  end

  test "compresses effeac01cb65c to ef2eac2bc" do
    assert Compress.compress("effeac01cb65c") == "ef2eac2bc"
  end

  test "compresses mattisagoodprogrammer to mat2isago2dprogram2er" do
    assert Compress.compress("mattisagoodprogrammer") == "mat2isago2dprogram2er"
  end
end
