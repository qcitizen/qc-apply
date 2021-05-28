defmodule Apply do
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
    |> Enum.map(fn {char, char_count} -> char <> Integer.to_string(char_count) end)
    |> Enum.join
  end
end
