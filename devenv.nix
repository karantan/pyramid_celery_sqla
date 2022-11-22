{ pkgs, ... }:

{
  env.ZSH_THEME = "aussiegeek";
  env.ZSH_DISABLE_COMPFIX = "true";

  packages = [
    pkgs.git
    pkgs.zsh
    pkgs.python39Packages.poetry
    pkgs.python39Full
  ];

  enterShell = ''
    echo "To install:"
    echo
    echo "poetry install"
    echo
    echo "To run celery and web worker:"
    echo
    echo "devenv up"
  '';

  postgres.enable = true;
  redis.enable = true;

  processes.web.exec = "${pkgs.python39Packages.poetry}/bin/poetry run gunicorn --paste development.ini --bind localhost:8080 --reload --timeout 3600";
  processes.celery.exec = "${pkgs.python39Packages.poetry}/bin/poetry run celery worker -A pyramid_celery.celery_app --ini development.ini";

  # Additional optional settings
  pre-commit.hooks = {
    nixpkgs-fmt.enable = true;
    shellcheck.enable = true;
    black.enable = true;
  };
}
