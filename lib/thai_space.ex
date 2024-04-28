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

  def string_width(string) when is_binary(string) do
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
