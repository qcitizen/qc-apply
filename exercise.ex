defmodule MyApp.Exercise do
  @moduledoc "Write a function that compresses an alphanumeric string by collapsing consecutive values. The rules of the compression algorithm are defined by the test cases below."

  def test_case(input) do
    with input <-
           input |> String.split("") |> Enum.reject(&(&1 == "")) |> Enum.reject(&is_number?(&1)) do
      process_input(input, 1, "", "")
    end
  end

  defp process_input([], _acc, value, main_value), do: main_value

  defp process_input([head | tail], acc, value, main_value) do
    case head == String.last(value) do
      true ->
        acc = acc + 1
        length = main_value |> String.length()
        main_value = "#{main_value |> String.slice(0, length - 1)}#{acc}"
        process_input(tail, acc, value, main_value)

      _ ->
        acc = 1
        value = "#{value}#{head}"
        main_value = "#{main_value}#{head}#{acc}"
        process_input(tail, acc, value, main_value)
    end
  end

  defp is_number?(data) do
    with data when is_number(data) <- String.to_integer(data) do
      true
    else
      _ -> false
    end
  rescue
    _ -> false
  end
end
