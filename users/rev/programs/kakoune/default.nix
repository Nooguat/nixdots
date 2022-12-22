{ pkgs, ... }:
{
    programs.kakoune = {
        config = {
            colorScheme = "nord";
            indentWidth = 2;
            tabStop = 2;
            alignWithTabs = true;
            numberLines.enable = true;
            numberLines.highlightCursor = true;
            wrapLines.enable = true;
            wrapLines.word = true;
            scrollOff = {
                lines = 5;
                columns = 3;
            };
        };
            extraConfig = "
		set-option global startup_info_version 202110923
		require-module powerline
		require-module prelude
		eval %sh{kak-lsp --kakoune -s \$kak_session}
            ";
        plugins = (
         with pkgs; [
             editorconfig-core-c
             kakounePlugins.auto-pairs-kak
             kakounePlugins.kak-lsp
             kakounePlugins.powerline-kak
             kakounePlugins.prelude-kak
         ]);
    };
    xdg.configFile."kak/colors/nord.kak".source = ./nord.kak;
    xdg.configFile."kak-lsp/kak-lsp.toml".source = ./kak-lsp.toml;
}
