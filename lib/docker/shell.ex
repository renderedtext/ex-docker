defmodule Docker.Shell do
  def execute(command) do
    command |> String.to_char_list |> :os.cmd |> to_string
  end
end
