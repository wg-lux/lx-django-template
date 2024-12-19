{ pkgs, lib, config, inputs, ... }:
let

  buildInputs = with pkgs; [
    python311Full
    stdenv.cc.cc
  ];

in
{
  dotenv.enable = false;
  dotenv.disableHint = true;


  packages = with pkgs; [
    cudaPackages.cuda_nvcc
    stdenv.cc.cc
  ];

  env = {
    LD_LIBRARY_PATH = "${
      with pkgs;
      lib.makeLibraryPath buildInputs
    }:/run/opengl-driver/lib:/run/opengl-driver-32/lib";

  };


  languages.python = {
    enable = true;
    uv = {
      enable = true;
      sync.enable = true;
    };
  };

  # Einfache Shell-Initialisierung
  enterShell = ''
    . .devenv/state/venv/bin/activate
  '';

  scripts.runrun-dev-server.exec =
    "${pkgs.uv}/bin/uv run python lx_pipeline/main.py";

  # Definiere Prozesse
  processes = {
    run_dev_server.exec = "run-dev-server"; # "${pkgs.python311}/bin/python agl_anonymizer_pipeline/main.py --image images/lebron_james.jpg";
  };

  # Deaktiviere automatische Cache-Konfiguration
  cachix.enable = true;
}
