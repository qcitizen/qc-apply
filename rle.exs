defmodule RunLengthEncoder do
  @digits ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

  @doc """
  This is a naive implementation of a Run Length Encoder.
  "aa1bb2bc"                               <- First we take a string
  ["a", "a", "1", "b", "b", "2", "b", "c"] <- Separate it to graphemes
  ["a", "a", "b", "b", "b", "c"]           <- Drop digits
  [["a", "a"], ["b", "b", "b"], ["c"]]     <- Chunk by clusters of same graphemes
  ["a", 2, "b", 3, "c"]                    <- Replace every cluster with grapheme-length pair
  "a2b3c"                                  <- Join into string
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) when is_binary(string) do
    string
    |> String.graphemes()
    |> Enum.reject(fn x -> x in @digits end)
    |> Enum.chunk_by(& &1)
    |> Enum.flat_map(fn
      [x] -> [x]
      [x | _] = l -> [x, length(l)]
    end)
    |> Enum.join()
  end

  def encode(_not_string), do: raise("Unexpected argument type")
end
