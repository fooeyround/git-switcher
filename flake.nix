{
  description = "A simple Nix flake";

  outputs = { self, nixpkgs, ... }@inputs: {
    packages.x86_64-linux.default = with nixpkgs.legacyPackages.x86_64-linux; buildGoModule rec {
      pname = "git-switcher";
      version = "0.3.0";

    src = fetchFromGitHub {
      owner = "TheYkk";
      repo = "git-switcher";
      rev = "v${version}";
      hash = "sha256-Gjw1dRrgM8D3G7v6WIM2+50r4HmTXvx0Xxme2fH9TlQ=";
    };

    vendorSha256 = null;
    #src = "./.";
    vendorHash = null;

    CGO_ENABLED = 0;

    outputs = [ "out" "man" ];

    ldflags = [
      "-s" "-w" "-X main.version=${version} -X main.revision=${version}"
    ];



    buildInputs = [ ];
      meta = {
        description = "Easily switch between your git profiles";
        license = lib.licenses.asl20;
        maintainers = with lib.maintainers; [ ];
      };
    };
  };
}
