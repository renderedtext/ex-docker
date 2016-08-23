defmodule Docker do

  defmodule Image do
    alias Docker.Parser
    alias Docker.Shell

    def list do
      Shell.execute("docker images --format raw") |> Parser.parse
    end

    def list(repository: name) do
      list |> Enum.filter(fn(image) -> String.contains?(image.repository, name) end)
    end

    def find(repository: name), do: list(repository: name) |> hd

    def run(%{image_id: id}, options \\ []) do
      command   = Keyword.get(options, :command)   || ""
      net       = Keyword.get(options, :net)       || "bridge"
      variables = Keyword.get(options, :variables) || %{}

      command = "docker run --net=#{net} #{prepare_variables(variables)} -tdi #{id} #{command}"

      container_id = Shell.execute(command)

      short_id = container_id |> String.slice(0..11)

      Docker.Container.find(container_id: short_id)
    end

    defp prepare_variables(env_vars) do
      env_vars
      |> Enum.map(fn({k, v}) -> "-e #{to_string(k)}=#{to_string(v)} " end)
      |> Enum.join(" ")
    end
  end

  defmodule Container do
    alias Docker.Parser
    alias Docker.Shell

    def list do
      Shell.execute("docker ps --format raw") |> Parser.parse
    end

    def list(image: image) do
      list |> Enum.filter(fn(container) -> String.contains?(container.image, image) end)
    end

    def list(container_id: id) do
      list |> Enum.filter(fn(container) -> String.contains?(container.container_id, id) end)
    end

    def find(image: image),     do: list(image: image) |> hd
    def find(container_id: id), do: list(container_id: id) |> hd

    def stop(%{container_id: id}) do
      Shell.execute("docker stop #{id}")
      nil
    end

    def logs(%{container_id: id}) do
      Shell.execute("docker logs #{id}")
    end
  end

end
