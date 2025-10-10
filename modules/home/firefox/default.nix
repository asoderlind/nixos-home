{
  user,
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
let
  extra-extensions.rys = inputs.firefox-addons.lib."x86_64-linux".buildFirefoxXpiAddon {
    pname = "RYS — Remove YouTube Suggestions";
    version = "4.3.54";
    addonId = "c7ad48bb-c7f5-42ec-8882-3b65f955c225";
    url = "https://addons.mozilla.org/firefox/downloads/file/4246711/remove_youtube_s_suggestions-4.3.54.xpi";
    sha256 = "sha256-1OqTBaa+9yul7Py3DgZYl14PI61mRAndrf88l7HsX84=";
    meta = with lib; {
      homepage = "https://prod.outgoing.prod.webservices.mozgcp.net/v1/f0c080567cceb13a165ec97ae4e7b0444fad901efa22634c1f89a5ae3b23f94d/https%3A//github.com/lawrencehook/remove-youtube-suggestions";
      description = "Stop the YouTube rabbit hole. Customize YouTube's user interface to be less engaging.";
      license = licenses.mpl20;
      platforms = platforms.all;
    };
  };
in
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
          "youtube" = {
            urls = [
              {
                template = "https://www.youtube.com/results";
                params = [
                  {
                    name = "search_query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = builtins.fetchurl {
              url = "https://www.youtube.com/favicon.ico";
              sha256 = "sha256:07cip1niccc05p124xggbmrl9p3n9kvzcinmkpakcx518gxd1ccb";
            };
            definedAliases = [
              "!y"
              "!you"
              "!youtube"
            ];
          };
        };
        search.force = true;
        extensions.packages = [
          inputs.firefox-addons.packages."x86_64-linux".ublock-origin
          inputs.firefox-addons.packages."x86_64-linux".sponsorblock
          inputs.firefox-addons.packages."x86_64-linux".return-youtube-dislikes
          inputs.firefox-addons.packages."x86_64-linux".vimium
          inputs.firefox-addons.packages."x86_64-linux".darkreader
          extra-extensions.rys
        ];
        userChrome = ''
          @import "${theme.userChrome}";
        '';
        userContent = ''
          @import "${theme.userChrome}";
        '';
        extraConfig = theme.userJs;
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable customChrome.cs
          "xpinstall.signatures.required" = false; # Make extensions work
          # "browser.uidensity" = 0; # Set UI density to normal
          # "svg.context-properties.content.enabled" = true; # Enable SVG context-propertes
          "browser.startup.homepage" = "https://news.ycombinator.com"; # Set homepage to Hacker News
        };
      };
    };
}
