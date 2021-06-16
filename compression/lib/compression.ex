defmodule Compression do
  @moduledoc """
  This module handles all operations related to compressing
  """

  @doc """
  Compress a given string.

  Given an alphanumeric input this function compresses
  the text string into a smaller string.

  ## Examples
      iex> Compression.compress("aaabccccdd")
      :a3bc4d2

      iex> Compression.compress("aaaaaffffffffffc")
      :a5f10c

      iex> Compression.compress("abcd")
      :abcd

      iex> Compression.compress("ccceee12eccceee")
      :c3e4c3e3

      iex> Compression.compress("effeac01cb65c")
      :ef2eac2bc
  """
  def compress(input_string \\ "") do
    input_string
    |> remove_numeric()
    |> group_repeating()
    |> transform()
    |> Enum.join()
  end

  @doc """
  Given a text string remove all non-character entries

    ## Examples
      iex> Compression.remove_numeric("ccceee12eccceee")
      :ccceeeeccceee
  """
  def remove_numeric(input) do
    input |> String.replace(~r/[^\D]/, "")
  end

  @doc """
  Group all ocurrences.

  Given a text string group all contiguous text occurrences in blockst

  This function returns a list with the repeating groups

    ## Examples
      iex> Compression.group_repeating("ccceeeeccceee")
      :["ccc", "eeee", "ccc", "eee"]
  """
  def group_repeating(input) do
    Regex.scan(~r/(.)(\1*)/, input)
    |> Enum.reduce([], fn x, acc ->
      acc ++ [List.first(x)]
    end)
  end

  @doc """
  Transform input to desired output format.any()

  Given a list of repeating groups, transform the inputs
  into the desired outputs.

    ## Examples
      iex> Compression.transform(["aaa", "bbb", "c", "dd"])
      ["a3", "b3", "c", "dd"]
  """
  def transform(groups \\ []) do
    groups
    |> Enum.reduce([], fn input, acc ->
      first_char = String.at(input, 0) #First character
      s_len = String.length(input) #String lenght

      if s_len > 1 do
        acc ++ [first_char <> "#{s_len}"] #Concat string
      else
        acc ++ [first_char]
      end
    end)
  end
end
