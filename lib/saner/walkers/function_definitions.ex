defmodule Saner.Walkers.FunctionDefinitions do
  alias Saner.Structs.Mfa
  alias Saner.Structs.Location

  defmodule State do
    defstruct module_stack: [],
              cur_module: nil,
              hits: %{}

    def new() do
      %__MODULE__{}
    end

    def push_modules(state, modules) when is_list(modules) do
      %__MODULE__{state | module_stack: [modules | state.module_stack]}
      |> render_module_stack()
    end

    def pop_modules(%__MODULE__{module_stack: [_ | tail]} = state) do
      %__MODULE__{state | module_stack: tail}
      |> render_module_stack()
    end

    defp render_module_stack(state) do
      %__MODULE__{state | cur_module: :TODO}
    end
  end

  @spec extract(ast :: term) :: [{Mfa.t(), Location.t()}]
  def extract(ast) do
    {_new_ast, state} = Macro.traverse(ast, State.new(), &pre_visit/2, &post_visit/2)
    Enum.reverse(state.hits)
  end

  def pre_visit(node, acc), do: visit(node, acc, :pre)
  def post_visit(node, acc), do: visit(node, acc, :post)

  def visit({:defmodule, _meta, [{:__aliases__, _, module_parts} | _]} = ast, state, stage) do
    # IO.inspect state.module_stack, label: :stack
    case stage do
      :pre ->
        {ast, State.push_modules(state, module_parts)}

      :post ->
        {ast, State.pop_modules(state)}
    end
  end

  # NOTE this doesn't account for guards
  def visit({:def, meta, [{function_name, _, args}, [do: _]]} = ast, state, :pre) do
    IO.puts("#{function_name} is defined with #{inspect(args)}")
    {ast, state}
  end

  def visit(node, acc, stage) do
    # IO.inspect(node)
    # IO.inspect(stage)
    # IO.puts "NOP"
    {node, acc}
  end
end
