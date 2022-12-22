{ config, pkgs, ... }:
    {
        imports = [ ./zsh ./fzf ./kakoune ./git ];
    }
