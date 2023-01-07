# Disable USB wakeup
# https://github.com/9999years/nix-config/blob/3d2aef1418cab766ab744129f4308e1596f1335c/modules/usb-wakeup-disable.nix
{ config, lib, pkgs, flake-self, nur, ... }:
with lib;
let
  cfg = config.fra.usbWakeupDisabled;

  vendorProductStr = types.strMatching "^[0-9a-fA-F]{4}$";

  vendorProductStrDesc = ty: ''
    The device's ${ty} ID, as a 4-digit hex string.
    ${ty} IDs of USB devices can be listed with <code>nix-shell -p usbutils
    --run lsusb</code>, where an output line like <code>Bus 002 Device 003: ID
    046d:c52b Logitech, Inc. Unifying Receiver</code> has a vendor ID of
    <code>046d</code> and a product ID of <code>c52b</code>.
    All strings are converted to lowercase.
  '';

  udevRules = pkgs.writeTextDir "etc/udev/rules.d/90-usb-wakeup-configure.rules"
    (concatStringsSep "\n" (forEach cfg.devices (devCfg:
      let wakeStr = if devCfg.wakeup then "enabled" else "disabled";
      in concatStringsSep ", " [
        ''ACTION=="add"''
        ''ATTRS{idVendor}=="${toLower devCfg.vendor}"''
        ''ATTRS{idProduct}=="${toLower devCfg.product}"''
        ''ATTR{power/wakeup}="${wakeStr}"''
      ]
    )));
in
{
  options.fra.usbWakeupDisabled = {
    enable = mkEnableOption "enable disabling usb wakeup";

    devices = mkOption {
      description = "The list of usb devices prevented from waking up from sleep";
      default = [ ];
      type = types.listOf (types.submodule {
        options = {
          vendor = mkOption {
            description = vendorProductStrDesc "Vendor";
            type = vendorProductStr;
            example = "046d";
          };
          product = mkOption {
            description = vendorProductStrDesc "Product";
            type = vendorProductStr;
            example = "c52b";
          };
          wakeup = mkOption {
            description = ''
              Is this device allowed to wake the computer from sleep?
              By default, any devices here are explicitly
              <emphasis>not</emphasis> allowed to wake the computer from sleep.
            '';
            type = types.bool;
            default = false;
            example = true;
          };
        };
      });
    };
  };

  config = mkIf cfg.enable {
    services.udev.packages = [ udevRules ];
  };
}
