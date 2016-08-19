defmodule Docker do

  defmodule Images do
    alias Docker.Parser
    alias Docker.Shell

    def list do
      Shell.execute("docker images --format raw") |> Parser.parse
    end

    def list(repository: name) do
      list |> Enum.find(fn(image) -> image.repository =~ name end)
    end
  end

  defmodule Containers do
    alias Docker.Parser
    alias Docker.Shell

    def list do
      Shell.execute("docker ps --format raw") |> Parser.parse
    end

    def list(image: name) do
      list |> Enum.find(fn(container) -> container.image =~ name end)
    end
  end

end
