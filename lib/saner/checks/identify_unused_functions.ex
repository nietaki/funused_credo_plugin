defmodule Saner.Checks.IdentifyUnusedFunctions do
  # used for the use below
  @checkdoc """
  This ModuleDoc check is much better than the original one!!!11
  """
  @explanation [
    check: @checkdoc
  ]

  # you can configure the basics of your check via the `use Credo.Check` call
  use Credo.Check, base_priority: :high, category: :readbility

  @doc false
  def run(source_file, params \\ []) do
    # return no issues - TODO: implement actual check
    # raise "foo"

    IO.inspect(source_file)
    IO.inspect(params)

    Credo.Code.prewalk(source_file, fn x, acc ->
      IO.inspect(x)
      {x, acc}
    end)

    []
  end
end
