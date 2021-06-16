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
end
