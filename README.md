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

# TODO
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

