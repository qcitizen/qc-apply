defmodule CompressorTest do
  use ExUnit.Case
  doctest Compressor

  test "compresses aaabccccdd to a3bc4d2" do
    assert Compressor.compress("aaabccccdd") == "a3bc4d2"
  end

  test "aaaaaffffffffffc to a5f10c" do
    assert Compressor.compress("aaaaaffffffffffc") == "a5f10c"
  end

  test "compresses abcd to abcd" do
    assert Compressor.compress("abcd") == "abcd"
  end

  test "compresses ccceee12eccceee to c3e4c3e3" do
    assert Compressor.compress("ccceee12eccceee") == "c3e4c3e3"
  end

  test "compresses effeac01cb65c to ef2eac2bc" do
    assert Compressor.compress("effeac01cb65c") == "ef2eac2bc"
  end

  test "compresses mattisagoodprogrammer to mat2isago2dprogram2er" do
    assert Compressor.compress("mattisagoodprogrammer") == "mat2isago2dprogram2er"
  end
end
