{ lib, stdenv, bundlerApp, }:
bundlerApp {
  pname = "youplot";
  exes = [ "youplot" "uplot" ];
  gemdir = ./.;
  meta = with lib; {
    homepage = "https://github.com/red-data-tools/YouPlot";
    description = "A command line tool that draw plots on the terminal. ";
    license = [ ];
    maintainers = [ ];
  };
}
