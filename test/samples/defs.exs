defmodule Samples.Defs do
  def foo() do
    nil
  end

  def bar(x), do: nil

  def baz(x, y \\ []), do: nil

  def ban(a, b, c) when is_atom(a) and b > c do
  end

  defmodule Inner do
  end
end
