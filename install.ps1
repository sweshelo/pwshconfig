@(
  "microsoft.powershell",
  "microsoft.windowsterminal",
  "Mozilla.Firefox",
  "nodejs",
  "Docker.DockerDesktop",
  "Valve.Steam",
  "Git.Git",
  "neovim.neovim"
) | % { winget install $_ }

iwr get.scoop.sh | iex && @(
  "7zip",
  "ffmpeg",
  "gsudo",
  "python",
  "youtube-dl"
) | % { scoop install $_ }

npm install -g yarn
pip3 install pynvim

