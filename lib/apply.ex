defmodule Apply do
  @doc """
  Compresses an alphanumeric string, removing numeric characters and then
  collapsing repeated alphabetic characters to the character and then the
  number of repetitions.

  ## Examples

      iex> Apply.compress("aaabccccdd")
      "a3bc4d2"

      iex> Apply.compress("aaaaaffffffffffc")
      "a5f10c"

      iex> Apply.compress("abcd")
      "abcd"

      iex> Apply.compress("ccceee12eccceee")
      "c3e4c3e3"

      iex> Apply.compress("effeac01cb65c")
      "ef2eac2bc"

  """
  def compress(str) do
    str
    |> String.replace(~r/\d+/, "") # remove digits
    |> String.graphemes
    |> Enum.reduce([], fn char, acc ->
    # the accumulator builds an ordered list of tuples of the form {char, char_count}
    if acc == [] do
      [{char, 1}]
    else
      [{last_char, last_char_count} | rest] = acc
      if char == last_char do
        [{last_char, last_char_count + 1} | rest]
      else
        [{char, 1} | acc]
      end
    end
    end)
    |> Enum.reverse
    |> Enum.map(fn {char, char_count} ->
      if char_count > 1 do
        char <> Integer.to_string(char_count)
      else
        char
      end
    end)
    |> Enum.join
  end
end
