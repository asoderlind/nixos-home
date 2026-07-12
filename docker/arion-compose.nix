{ pkgs, ... }:
{
  project.name = "hello-world-project";

  services = {
    hello-world = {
      service = {
        image = "hello-world:latest";
        container_name = "hello-world-container";
      };
    };
  };
}
