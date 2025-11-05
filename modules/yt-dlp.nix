{ config, lib, pkgs, ... }:

{
  programs.yt-dlp.enable = true;
  programs.yt-dlp.package = pkgs.yt-dlp;

  settings = {
    downloader-args = "-o '%(title)s.%(ext)s'";
  };
}
