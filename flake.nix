{
  outputs = _: {
    flakeModule = ./nix/flake-module.nix;

    templates.default = {
      description = "Example flake using process-compose-flake";
      path = builtins.path { path = ./example; filter = path: _: baseNameOf path == "flake.nix"; };
    };

    # https://github.com/srid/nixci
    nixci.default = let overrideInputs = { process-compose-flake = ./.; }; in {
      example = {
        inherit overrideInputs;
        dir = "example";
      };
    };
  };
}
