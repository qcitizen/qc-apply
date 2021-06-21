defmodule Compressor do
  @moduledoc """
  Documentation for `Compressor`.
  """

  @doc """
  Compresses strings of numeric values by taking out additional letters and replacing them with the number oof occurrences

  ##Examples
  iex>Compressor.compress("aaabccccdd")
  "a3bc4d2"

  iex>Compressor.compress("aaaaaffffffffffc")
  "a5f10c"

  iex>Compressor.compress("abcd")
  "abcd"

  iex>Compressor.compress("ccceee12eccceee")
  "c3e4c3e3"

  iex>Compressor.compress("effeac01cb65c")
  "ef2eac2bc"
  """

  def compress(uncompressed) do
    uncompressed |> to_charlist |> next_comp(1)
  end

  @doc """
  Reverses compress except it doesn't put back numbers if they were in tihe original string as the compression is lossy in that respect

  ##Examples
  iex>Compressor.compress("aaabccccdd") |> Compressor.decompress()
  "aaabccccdd"

  iex>Compressor.compress("aaaaaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc") |> Compressor.decompress()
  "aaaaaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc"

  iex>Compressor.compress("abcd") |> Compressor.decompress()
  "abcd"

  iex>Compressor.compress("ccceee12eccceee") |> Compressor.decompress()
  "ccceeeeccceee"

  iex>Compressor.compress("effeac01cb65c") |> Compressor.decompress()
  "effeaccbc"
  """
  def decompress(compressed) do
    compressed |> to_charlist |> next_decomp()
  end

  defp next_comp([], _count) do
    ""
  end

  # Filter out numeric
  defp next_comp([a | tail], count) when a in ?0..?9 do
    next_comp(tail, count)
  end

  # Filter out numeric
  defp next_comp([a, b | tail], count) when b in ?0..?9 do
    next_comp([a | tail], count)
  end

  # Matching so bump count
  defp next_comp([a, a | _] = charlist, count) when a in ?a..?z do
    next_comp(charlist |> tl, count + 1)
  end

  # End of a match on count 1 so don't use the digit
  defp next_comp([a | tail], 1) when a in ?a..?z do
    "#{[a] |> List.to_string()}" <> next_comp(tail, 1)
  end

  # End of a match so update accumulator
  defp next_comp([a | _] = charlist, count) when a in ?a..?z do
    "#{[a] |> List.to_string()}#{count}" <> next_comp(charlist |> tl, 1)
  end

  defp next_comp(charlist, count) do
    next_comp(charlist |> tl, count)
  end

  defp next_decomp([]) do
    ""
  end

  defp next_decomp([a, b | tail]) when a in ?a..?z and b in ?0..?9 do
    # The number could be more than one or two digits
    [tail, repeat_by] = get_number([b | tail])

    repeat =
      repeat_by
      |> List.to_string()
      |> String.to_integer()

    String.duplicate([a] |> List.to_string(), repeat) <> next_decomp(tail)
  end

  defp next_decomp([head | tail]) when head in ?a..?z do
    List.to_string([head]) <> next_decomp(tail)
  end

  defp get_number(list, repeat_by \\ '')

  defp get_number([head | tail], repeat_by) when head in ?0..?9 do
    get_number(tail, repeat_by ++ [head])
  end

  defp get_number(tail, repeat_by) do
    [tail, repeat_by]
  end
end
