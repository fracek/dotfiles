{ lib
, appimageTools
, fetchurl
}:
appimageTools.wrapType2 rec {
  pname = "en-croissant";
  version = "0.11.1";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://github.com/franciscoBSalgueiro/en-croissant/releases/download/v0.11.1/en-croissant_0.11.1_amd64.AppImage";
    hash = "sha256-HfUZGV4cgXgOA2sfyVyqTSQdJaUe6eBk43BslF7SfVc=";
  };

  meta = {
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ ];
    platforms = lib.platforms.linux;
  };
}

