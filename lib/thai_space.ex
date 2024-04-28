defmodule ThaiSpace do
  @moduledoc """
  Thai script calculations
  """

  @doc """
  Returns the width a string
  occupies in the termainl.

  ## Examples

      iex> ThaiSpace.string_width("ผู้นำ")
      3

  """
  @sara_am 3635

  def string_width(string) do
    string
    |> String.next_grapheme()
    |> string_width(0)
  end

  def string_width(nil, count) do
    count
  end

  def string_width({<<_codepoint::utf8, @sara_am::utf8>>, rest}, count) do
    rest
    |> String.next_grapheme()
    |> string_width(count + 2)
  end

  def string_width({<<_codepoint_1::utf8, _codepoint_2::utf8, @sara_am::utf8>>, rest}, count) do
    rest
    |> String.next_grapheme()
    |> string_width(count + 2)
  end

  def string_width({_other, rest}, count) do
    rest
    |> String.next_grapheme()
    |> string_width(count + 1)
  end

  def string_width2(string) when is_binary(string) do
    string
    |> String.graphemes()
    |> Enum.reduce(0, fn grapheme, acc ->
      case String.to_charlist(grapheme) do
        [_codepoint_1, @sara_am] -> acc + 2
        [_codepoint_1, _codepoint_2, @sara_am] -> acc + 2
        _other -> acc + 1
      end
    end)
  end
end
