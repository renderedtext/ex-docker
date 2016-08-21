# Docker

Easy docker management from Elixir.

## Installation

``` elixir
def deps do
  {:docker, github: "renderedtext/ex-docker"}
end
```

## Usage

List docker images:

``` elixir
Docker.Image.list

=> [
     %{
        created_at: "2016-08-11 19:46:03 +0200 CEST",
        image_id: "ff6011336327",
        repository: "ubuntu",
        tag: "14.04",
        virtual_size: "188 MB"
     }
   ]
```

Filter docker images by repository name:

``` elixir
Docker.Image.list(repository: ~r/ubuntu/)
```

Find docker image:

``` elixir
Docker.Image.find(repository: ~r/ubuntu/)
```

Run docker image:

``` elixir
Docker.Image.find(repository: ~r/ubuntu/) |> Docker.Image.run("echo 'test'")
```

List docker containers:

``` elixir
Docker.Container.list

=> [
     %{
       command: "\"bash\"",
       container_id: "bbcabf45d518",
       created_at: "2016-08-21 15:46:51 +0200 CEST",
       image: "ubuntu:14.04",
       labels: "",
       names: "zen_goldwasser",
       ports: "",
       status: "Up 38 seconds"
     }
   ]
```

Filter containers by image name:

``` elixir
Docker.Image.list(image: ~r/ubuntu/)
```
