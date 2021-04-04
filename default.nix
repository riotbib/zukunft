{ config, lib, pkgs, ... }:

with lib;

let
  zukunft = pkgs.python3.pkgs.buildPythonApplication {
    pname = "zukunft";
    version = "unstable";

    src = lib.cleanSource ./.;

    installPhase = ''
      mkdir -p $out/bin
      cp $src/zukunft.py $out/bin
      chmod +x $out/bin/zukunft.py
      cp -r $src/views $out/bin/
    '';

    propagatedBuildInputs = with pkgs.python3Packages; [ bottle ];

  };

  zukunft-uid = 9161;

  cfg = config.services.zukunft;

in {
  options.services.zukunft = {
    enable = mkEnableOption "zukunft";

    path = mkOption {
      default = "/var/lib/zukunft";
      type = types.path;
      description = "Directory for zukunft's store";
    };

    token = mkOption {
      default = "OrdnungInsChaos";
      type = types.str;
      description = "Token for access to zukunft instance";
    };

  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ zukunft ];

    systemd.services.zukunft = {
      description = "zukunft";

      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        ExecStart = ''
          ${zukunft}/bin/zukunft.py \
            -p ${cfg.path} \
            -t ${cfg.token}
        '';

        Type = "simple";

        User = "zukunft";
        Group = "zukunft";
      };
    };

    users.users.zukunft = {
      group = "zukunft";
      home = cfg.path;
      createHome = true;
      uid = zukunft-uid;
    };

    users.groups.zukunft.gid = zukunft-uid;

  };


}
