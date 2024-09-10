git-switcher = buildGoModule rec {
  pname = "pet";
  version = "0.3.0";

#  src = fetchFromGitHub {
#    owner = "knqyf263";
#    repo = "gi";
#    rev = "v${version}";
#    hash = "sha256-Gjw1dRrgM8D3G7v6WIM2+50r4HmTXvx0Xxme2fH9TlQ=";
#  };
  src = "./.";
  venderSha256 = null;
  vendorHash = "sha256-ciBIR+a1oaYH+H1PcC8cD8ncfJczk1IiJ8iYNM+R6aA=";

  meta = with lib; {
    description = "Easily switch between your git profiles";
    homepage = "https://github.com/TheYkk/git-switcher";
    license = licenses.apache;
    maintainers = with maintainers; [ fooeyround ];
  };
}
