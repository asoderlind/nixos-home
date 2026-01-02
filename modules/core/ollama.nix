{ pkgs, ... }:
{
  # Ollama LLM Service
  services.ollama = {
    enable = true;
    acceleration = "cuda"; # NVIDIA GPU acceleration
    # Optionally preload models on startup
    # loadModels = [ "llama3.2:3b" ];
  };

  # Optional: Enable Open WebUI for a web interface
  # Accessible at http://localhost:8080
  # services.open-webui.enable = true;

  # Add ollama CLI to system packages
  environment.systemPackages = with pkgs; [
    ollama
  ];
}
