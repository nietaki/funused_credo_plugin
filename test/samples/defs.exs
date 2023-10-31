defmodule Samples.Defs do
  def foo() do
    nil
  end

  def bar(x), do: nil

  def baz(x, [_ | _] = y \\ [:foo]), do: nil

  defmodule Inner do
    def foo(x, y \\ nil, z \\ [])

    def foo(_x, _y, _z), do: nil
  end

  def ban(a, %{} = b, c) when is_atom(a) and b > c do
  end
end
