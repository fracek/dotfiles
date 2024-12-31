{ lib
, appimageTools
, fetchurl
}:
let
  pname = "msty";
  version = "1.0";
  name = "${pname}-${version}";
  src = fetchurl {
    url = "https://assets.msty.app/prod/latest/linux/amd64/Msty_x86_64_amd64.AppImage";
    name = "Msty_x86_64.AppImage";
    hash = "sha256-BUnolG0WofXwq4Wbd00RJHKVdGTyavx0g72KlW4dlTA=";
  };

  appimageContents = appimageTools.extractType2 { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit name src;

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/msty.desktop -t $out/share/applications
    cp -r ${appimageContents}/usr/share/icons $out/share
  '';

  meta = {
    license = lib.licenses.unfree;
    mainProgram = "msty";
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.linux;
  };
}
