{ pkgs, ... }:
let
  # Override Ollama to support GTX 1050 Ti (compute capability 6.1)
  ollama-cuda = pkgs.ollama.override {
    acceleration = "cuda";
    # Include sm_61 for GTX 1050 Ti and newer architectures
    cudaArches = [ "sm_61" "sm_70" "sm_75" "sm_80" "sm_86" "sm_89" "sm_90" ];
  };
in
{
  # Ollama LLM Service
  services.ollama = {
    enable = true;
    acceleration = "cuda"; # NVIDIA GPU acceleration
    package = ollama-cuda;
    # Optionally preload models on startup
    # loadModels = [ "llama3.2:3b" ];
  };

  # Optional: Enable Open WebUI for a web interface
  # Accessible at http://localhost:8080
  services.open-webui.enable = true;

  # Add ollama CLI to system packages
  environment.systemPackages = [
    ollama-cuda
  ];
}
