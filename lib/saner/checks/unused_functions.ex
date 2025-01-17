defmodule Saner.Checks.UnusedFunctions do
  alias Saner.Structs.Location
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
  def run(source_file, _params \\ []) do
    # return no issues - TODO: implement actual check
    # raise "foo"

    loc = Location.new(1, 2)
    _ = loc
    # IO.inspect loc

    # IO.inspect(source_file)
    # IO.inspect(params)
    IO.puts("unused function check")

    Credo.Code.prewalk(source_file, fn x, acc ->
      # IO.inspect(x)
      {x, acc}
    end)

    []
  end
end
