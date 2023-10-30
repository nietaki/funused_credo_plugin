defmodule Saner.Walkers.FunctionDefinitionsTest do
  use ExUnit.Case

  alias Saner.Walkers.FunctionDefinitions

  doctest FunctionDefinitions

  describe "extract" do
    test "sample file" do
      ast = get_ast("test/samples/defs.exs")
      IO.inspect(ast)
      mfas = FunctionDefinitions.extract(ast)
      assert {{Samples.Defs, :foo, 0}, _} = Enum.at(mfas, 0)
      flunk("foo")
    end
  end

  def get_ast(path) do
    file_contents = File.read!(path)
    {:ok, ast} = Credo.Code.ast(file_contents)
    ast
  end
end
