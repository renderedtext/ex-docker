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
Docker.Images.list

=> [
     %{
        created_at: "2016-08-11 19:46:03 +0200 CEST",
        image_id: "ff6011336327",
        repository: "ubuntu",
        tag: "14.04",
        virtual_size: "188 MB"
     },
     %{
        created_at: "2016-08-11 19:46:03 +0200 CEST",
        image_id: "ff6011336327",
        repository: "ubuntu",
        tag: "14.04",
        virtual_size: "188 MB"
     }
   ]
```

List docker containers:

``` elixir
Docker.Containers.list

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

