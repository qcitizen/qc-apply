defmodule QC do
  @moduledoc """
    compresses string according to assessmnet spec
  """

  def compress(str) do
    str
    |> String.split("")
    |> Enum.reduce({}, &reducer/2)
  end

  @doc """
  reducer/2 has 5 clauses. how they are used, in order of definition:
  1. initial iteration
  2. final iteration
  3. second iteration (the first time we see a non-empty string character)
  4. when previous character matches current character. increases count.
  5. when previous character doesn't match current character. removes numerical characters
  """
  def reducer("", {}), do: {}

  def reducer("", acc), do: combine(acc)
  def reducer(c, {}), do: {submemo(c), ""}

  def reducer(c, {{prev, count}, result}) when prev == c do
    {{prev, count + 1}, result}
  end

  def reducer(c, {{prev, _}, _} = acc) when prev != c do
    case Integer.parse(c) do
      {_, _} -> acc
      :error -> {submemo(c), combine(acc)}
    end
  end

  defp combine({{p, 1}, r}), do: r <> p
  defp combine({{p, c}, r}), do: r <> p <> "#{c}"

  defp submemo(c), do: {c, 1}
end
