{ lib, buildGoModule, fetchFromGitHub}: 
buildGoModule rec {
  pname = "git-switcher";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "TheYkk";
    repo = "git-switcher";
    rev = "v${version}";
    hash = "sha256-Gjw1dRrgM8D3G7v6WIM2+50r4HmTXvx0Xxme2fH9TlQ=";
  };

  #src = "./.";
  vendorHash = null;

  CGO_ENABLED = 0;

  outputs = [ "out" "man" ];

  ldflags = [
    "-s" "-w" "-X main.version=${version} -X main.revision=${version}"
  ];

  meta = {
    description = "Easily switch between your git profiles";
    homepage = "https://github.com/TheYkk/git-switcher";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ zowoq ]; #TEMP: should be `fooeyround` but that is not in the maintainer list
  };
}
