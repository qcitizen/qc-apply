defmodule Compressor do
  @moduledoc """
  Compress is a small module to compress alpha-numeric strings
  containing consecutive, duplicate letters.
  """

  @doc """
  Compress alpha-numeric string in the format of
  "aaabbbccc" down to "a3b3c3".

  ## Examples

      iex> Compressor.compress("aaabbbccc")
      "a3b3c3"

  """
  def compress(string) when is_binary(string) do
    string
    # create a list of the individual characters
    |> String.graphemes()
    # Filter out numbers in the original string
    |> Enum.filter(fn character ->
      case Integer.parse(character) do
        # is number, skip
        {_, ""} -> false
        # is text, keep
        _ -> true
      end
    end)
    # Group consecutive duplicates together
    |> Enum.chunk_by(fn character -> character end)
    # Create a list of lists, each with a letter 
    # and it's consecutive duplicate count next to it
    |> Enum.map(fn x ->
      case Enum.count(x) do
        # Skip the number if the letter count is 1
        1 -> [Enum.at(x, 0)]
        # Otherwise show letter with count
        _ -> [Enum.at(x, 0), Enum.count(x)]
      end
    end)
    # Flatten the list so that it's not nested
    |> List.flatten()
    # Then we can join them together to create a string
    |> Enum.join()
  end
end
