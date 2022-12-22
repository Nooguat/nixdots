{ pkgs, ... }:
{
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
		shellAliases = {
		 "update" = "/home/rev/nixconfig/update.sh";
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
	      {
    	      	name = "zsh-z";
    	      	file = "zsh-z.plugin.zsh";
    	      	src = "${pkgs.zsh-z}/share/zsh-z";
	      }
	      
	    ];
	     prezto = {
	      enable = true;
	      caseSensitive = false;
	      utility.safeOps = true;
	      editor = {
		dotExpansion = true;
		keymap = "vi";
		promptContext = true;
	      };
	      prompt = {
		theme = "powerline10k";
	      };
	     pmodules = [
		"autosuggestions"
		"completion"
		"directory"
		"editor"
		"fasd"
		"git"
		"terminal"
	      ];
	     };
	  };
}

