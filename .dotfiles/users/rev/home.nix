{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "rev";
  home.homeDirectory = "/home/rev";
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.zsh = {
	enable = true;
	enableAutosuggestions = true;
	autocd = true;
	enableCompletion = true;
	sessionVariables = {
    	  DISPLAY = ":100";
    	  EDITOR = "kak";
	};
	history = {
	  expireDuplicatesFirst = true;
	  ignoreDups = true;
	  ignoreSpace = true;
	  save = 20000;
	  size = 20000;
	  share = true;
	};
       plugins = [
      {
        name = "fast-syntax-highlighting";
        file = "fast-syntax-highlighting.plugin.zsh";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
      }
      
    ];
     prezto = {
      enable = true;
      caseSensitive = false;
      utility.safeOps = true;
      editor = {
        dotExpansion = true;
        keymap = "vi";
      };
      prompt = {
	theme = "pure";
      };
     pmodules = [
        "autosuggestions"
        "completion"
        "directory"
        "editor"
        "git"
        "terminal"
      ];
     };
  };
  home.packages = with pkgs;  [ kakoune bat git zsh ];
}
