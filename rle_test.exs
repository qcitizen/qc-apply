Code.compile_file("rle.exs", __DIR__)

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule RunLengthEncoderTest do
  use ExUnit.Case

  # @tag :pending
  test "encode empty string" do
    assert RunLengthEncoder.encode("") === ""
  end

  # @tag :pending
  test "encode single characters only are encoded without count" do
    assert RunLengthEncoder.encode("abcd") === "abcd"
  end

  # @tag :pending
  test "encode string with no single characters" do
    assert RunLengthEncoder.encode("aaabccccdd") == "a3bc4d2"
  end

  # @tag :pending
  test "encode single characters mixed with repeated characters" do
    assert RunLengthEncoder.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") ===
             "W12BW12B3W24B"
  end

  # @tag :pending
  test "encode multiple whitespace mixed in string" do
    assert RunLengthEncoder.encode("  hsqq qww  ") === " 2hsq2 qw2 2"
  end

  # @tag :pending
  test "encode lowercase characters" do
    assert RunLengthEncoder.encode("aabbbcccc") === "a2b3c4"
  end

  # @tag :pending
  test "encode numbers removed" do
    assert RunLengthEncoder.encode("ccceee12eccceee") === "c3e4c3e3"
  end

  # @tag :pending
  test "encode all at once" do
    assert RunLengthEncoder.encode("effeac01cb65c") === "ef2eac2bc"
  end

  # @tag :pending
  test "encode invalid arguments" do
    assert_raise RuntimeError, fn ->
      RunLengthEncoder.encode(:atom)
    end
  end
end
