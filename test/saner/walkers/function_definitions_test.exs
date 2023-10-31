defmodule Saner.Walkers.FunctionDefinitionsTest do
  use ExUnit.Case

  alias Saner.Walkers.FunctionDefinitions

  doctest FunctionDefinitions

  describe "extract" do
    test "sample file" do
      ast = get_ast("test/samples/defs.exs")
      # IO.inspect(ast)
      hits = FunctionDefinitions.extract(ast)
      hits = Enum.sort_by(hits, fn {{_m, _f, a}, location} -> {location.line, a} end)
      # IO.inspect(hits)
      assert {{Samples.Defs, :foo, 0}, _} = Enum.at(hits, 0)
      assert {{Samples.Defs, :bar, 1}, _} = Enum.at(hits, 1)
      assert {{Samples.Defs, :baz, 1}, _} = Enum.at(hits, 2)
      assert {{Samples.Defs, :baz, 2}, _} = Enum.at(hits, 3)
      assert {{Samples.Defs.Inner, :foo, 1}, _} = Enum.at(hits, 4)
      assert {{Samples.Defs.Inner, :foo, 2}, _} = Enum.at(hits, 5)
      assert {{Samples.Defs.Inner, :foo, 3}, _} = Enum.at(hits, 6)
      assert {{Samples.Defs, :ban, 3}, _} = Enum.at(hits, 7)
    end

    @tag :skip
    test "defdelegate" do
      flunk("TODO")
    end
  end

  def get_ast(path) do
    file_contents = File.read!(path)
    {:ok, ast} = Credo.Code.ast(file_contents)
    ast
  end
end
