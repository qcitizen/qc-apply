defmodule Compressor do
  @moduledoc """
  Module for assignment
  """

  @doc """
  Compresses an alphanumeric string by collapsing consecutive values.

  ## Examples

  iex> Compressor.compress("aabbbcdc")
  "a2b3cdc"
  """
  def compress(str) do
    str
    |> String.to_charlist()
    |> Enum.filter(fn c -> c not in ?0..?9 end)
    |> to_char_count_list()
    |> Enum.reverse()
    |> Enum.map(fn {char, count} -> {List.to_string([char]), count} end)
    |> Enum.reduce("", fn {char, count}, acc ->
      if count != 1, do: "#{acc}#{char}#{count}", else: "#{acc}#{char}" end)
  end

  defp to_char_count_list(l), do: to_char_count_list(l, [])

  defp to_char_count_list([], l) do
    l
  end

  defp to_char_count_list([hd | tl], []) do
    to_char_count_list(tl, [{hd, 1}])
  end

  defp to_char_count_list([hd | tl], [{hd, count} | rest ]) do
    to_char_count_list(tl, [{hd, count + 1} | rest])
  end

  defp to_char_count_list([hd | tl], l) do
    to_char_count_list(tl, [{hd, 1} | l ])
  end
end
