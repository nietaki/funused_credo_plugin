defmodule Saner.Structs.Location do
  defstruct [
    :line,
    :col
  ]

  @type t :: %__MODULE__{
          line: integer(),
          col: integer() | nil
        }

  def new(line, col) when is_integer(line) do
    %__MODULE__{
      line: line,
      col: col
    }
  end

  def from_meta(kw) do
    new(Keyword.get(kw, :line), Keyword.get(kw, :column))
  end
end
