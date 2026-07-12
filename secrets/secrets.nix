let
  danix = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAIH585BI1nwwhzhoqHTUh2es8oNHKb2MzErN93hqiPI";
  t14s = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINNsv4+5x5zMaRzqyqJo1Jgepmhuly3j5/h+GzDxWSZ/";
  nixnas = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL7bX5BtPt4d13KmpU/C/R4MlkQik6FlvhGXYfGpXlpx";

  all = [ danix nixnas ];
in
{
  "restic/repo" = {
    publicKeys = all;
    armor = true;
  };
  "restic/env" = {
    publicKeys = all;
    armor = true;
  };
  "restic/password" = {
    publicKeys = all;
    armor = true;
  };
}
