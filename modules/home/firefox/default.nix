{
  user,
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
{

  options.firefox = {
    username = lib.mkOption { type = lib.types.str; };
    theme = lib.mkOption {
      type = lib.types.str;
      default = "default";
    };
  };

  config.programs.firefox =
    let
      theme = import (./themes/${config.firefox.theme}.nix) { inherit pkgs lib; };
    in
    {
      enable = true;

      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "always"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"

        # ---- EXTENSIONS ----
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          "*".installation_mode = "allowed";
          # "uBlock0@raymondhill.net" = {
          #     install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          #     installation_mode = "force_installed";
          # };
        };
      };

      profiles.default = {
        bookmarks = {
          force = true;
          settings = [
            {
              name = "Nixos Packages";
              tags = [ "nixos" ];
              keyword = "nixpkgs";
              url = "https://search.nixos.org/packages";
            }
          ];
        };
        search.engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [
              "!np"
              "!nix"
              "!nixpkgs"
            ];
          };
        };
        search.force = true;
        #extensions.packages = [
        #    inputs.firefox-addons.packages."x86_64-linux".ublock-origin
        #    inputs.firefox-addons.packages."x86_64-linux".sponsorblock
        #    inputs.firefox-addons.packages."x86_64-linux".return-youtube-dislikes
        #];
        #userChrome = ''
        #    @import "${theme.userChrome}";
        #'';
        #userContent = ''
        #    @import "${theme.userChrome}";
        #'';
        #extraConfig = theme.userJs;
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable customChrome.cs
          "xpinstall.signatures.required" = false; # Make extensions work
          # "browser.uidensity" = 0; # Set UI density to normal
          # "svg.context-properties.content.enabled" = true; # Enable SVG context-propertes
        };
      };
    };
}
