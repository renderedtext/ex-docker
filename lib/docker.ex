defmodule Docker do

  defmodule Image do
    alias Docker.Parser
    alias Docker.Shell

    def list do
      Shell.execute("docker images --format raw") |> Parser.parse
    end

    def list(repository: name) do
      list |> Enum.filter(fn(image) -> image.repository =~ name end)
    end

    def find(repository: name), do: list(repository: name) |> hd

    def run(%{image_id: id}, command) do
      id = Shell.execute("docker run -tdi #{id} #{command}")

      short_id = id |> String.slice(0..11)

      Docker.Container.find(container_id: short_id)
    end
  end

  defmodule Container do
    alias Docker.Parser
    alias Docker.Shell

    def list do
      Shell.execute("docker ps --format raw") |> Parser.parse
    end

    def list(image: image) do
      list |> Enum.filter(fn(container) -> container.image =~ image end)
    end

    def list(container_id: id) do
      list |> Enum.filter(fn(container) -> container.container_id =~ id end)
    end

    def find(image: image),     do: list(image: image) |> hd
    def find(container_id: id), do: list(container_id: id) |> hd

    def stop(%{container_id: id}) do
      Shell.execute("docker stop #{id}")
      nil
    end
  end

end
