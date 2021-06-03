defmodule Apply do
  @doc """
  Implementation for following exercise
  Write a function that compresses an alphanumeric string by collapsing consecutive values.
  The rules of the compression algorithm are defined by the test cases below.

  """
  @spec compress(String.t()) :: String.t()
  def compress(<<letter::bytes-size(1), rest::bytes>>)do
    compress(rest,"",letter,1)
  end
  @spec compress(any()) :: any()
  def compress(anything)do
    anything
  end
  @spec compress(String.t(),String.t(),String.t(),integer) :: String.t()
  def compress(<<letter::bytes-size(1), rest::bytes>>, chars,last,count) when letter !== last do
    {chars,last,count} = concat_string(letter,chars,last,count)
    compress(rest,chars,last,count)
  end
  def compress(<<letter::bytes-size(1), rest::bytes>>, chars,last,count) when letter === last do
    compress(rest,chars,letter,count+1)
  end
  def compress("",chars,last,count) when count<=1 do
    chars<>last
  end
  def compress("",chars,last,count)  do
    {result,_,_}= concat_string("",chars,last,count)
    result
  end
  @spec concat_string(String.t(),String.t(),String.t(),integer) :: {String.t(),String.t(),integer}
  def concat_string(letter,chars,last,count) do
    with false <- is_integer?(letter),true <- count>1 do
      {chars <> last <> to_string(count),letter,1}
    else
      false-> {chars <> last,letter,1}
      true-> {chars,last,count}
    end
  end
  defp is_integer?(data) do
    with data when is_number(data) <- String.to_integer(data) do
      true
    else
      _ -> false
    end
  rescue
    _ -> false
  end

end