defmodule Apply do
  def compress(<<letter::bytes-size(1), rest::bytes>>)do
  compress(rest,"",letter,1)
  end
  def compress(<<letter::bytes-size(1), rest::bytes>>, chars,last,count) when letter !== last and count <=1 do
    compress(rest,chars<>last,letter,1)
  end
  def compress(<<letter::bytes-size(1), rest::bytes>>, chars,last,count) when letter !== last do
    compress(rest,chars<>last<>to_string(count),letter,1)
  end
  def compress(<<letter::bytes-size(1), rest::bytes>>, chars,last,count) when letter === last do
    compress(rest,chars,letter,count+1)
  end
  def compress("",chars,last,count) when count<=1 do
    chars<>last
  end
  def compress("",chars,last,count)  do
    chars<>last<>to_string(count)
  end
end