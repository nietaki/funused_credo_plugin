defmodule Funused do
  @config_file File.read!(".credo.exs")

  import Credo.Plugin

  def init(exec) do
    exec
    |> register_default_config(@config_file)
    |> register_command("demo", Funused.DemoCommand)
    |> register_cli_switch(:castle, :string, :X, fn switch_value ->
      {:castle, String.upcase(switch_value)}
    end)

    # |> prepend_task(:set_default_command, Funused.SetDemoAsDefaultCommand)
  end
end
