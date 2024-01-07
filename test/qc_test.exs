defmodule QcTest do
  use ExUnit.Case
  doctest QC

  test "QC.reducer/2" do
    iter1 = QC.reducer("a", {})

    assert iter1 == {{"a", 1}, ""}

    iter2 = QC.reducer("a", iter1)

    assert iter2 == {{"a", 2}, ""}

    iter3 = QC.reducer("a", iter2)

    assert iter3 == {{"a", 3}, ""}

    iter4 = QC.reducer("k", iter3)

    assert iter4 == {{"k", 1}, "a3"}

    iter5 = QC.reducer("q", iter4)

    assert iter5 == {{"q", 1}, "a3k"}

    iter6 = QC.reducer("q", iter5)

    assert iter6 == {{"q", 2}, "a3k"}

    iter7 = QC.reducer("3", iter6)

    assert iter7 == {{"q", 2}, "a3k"}
  end

  test "QC.compress/1" do
    assert QC.compress("aaabccccdd") == "a3bc4d2"
    assert QC.compress("aaaaaffffffffffc") == "a5f10c"
    assert QC.compress("abcd") == "abcd"
    assert QC.compress("ccceee12eccceee") == "c3e4c3e3"
    assert QC.compress("effeac01cb65c") == "ef2eac2bc"
  end
end
