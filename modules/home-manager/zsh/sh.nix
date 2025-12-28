{ config, pkgs, lib, ... }:

let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    la = "ls -la";
    "..." = "cd ../..";
    "hm" = "home-manager";
  };
in
{
  programs = {
    zsh = {
      enable = true;
      
      zprof.enable = false; # <-- For performance tests
    
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      autocd = true;
      shellAliases = myAliases;



      oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
        "sudo" 
        "colored-man-pages" 
        "command-not-found"
        "z"
        "history"
        ];
      };

      initContent = lib.mkMerge [
      (lib.mkBefore ''
      
      # P10k instant prompt

      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi 
      '')
      ''
      # Keybindings
      bindkey '^H' backward-kill-word
    ''
    ];
    };
  };
}
