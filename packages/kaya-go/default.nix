{
  lib,
  appimageTools,
  fetchurl,
}:
appimageTools.wrapType2 rec {
  pname = "kaya-go";
  version = "0.2.4";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://github.com/kaya-go/kaya/releases/download/v${version}/Kaya_${version}_amd64.AppImage";
    hash = "sha256-MWAxLiVt0u6DdLo1f8ywG+MIwL7OyxU2fF34i94fUfc=";
  };

  meta = {
    license = lib.licenses.gpl3;
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
}
