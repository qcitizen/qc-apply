defmodule Apply do
  def compress(<<letter::bytes-size(1), rest::bytes>>)do
  compress(rest,"",letter,1)
  end
  def compress(anything)do
    anything
  end
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