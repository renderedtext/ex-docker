# Docker

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add docker to your list of dependencies in `mix.exs`:

        def deps do
          [{:docker, "~> 0.0.1"}]
        end

  2. Ensure docker is started before your application:

        def application do
          [applications: [:docker]]
        end

