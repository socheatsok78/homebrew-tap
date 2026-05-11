cask "chirp@next" do
  version "20260508"
  sha256 "6d0955edd607f112dee08e77e14d04970bcdbf2403dc7944a7d935a6271513cb"

  url "https://github.com/homebrew-sdr/chirpmyradio-archive/releases/download/next-#{version}/chirp-next-#{version}.app.zip",
      verified: "github.com/homebrew-sdr/chirpmyradio-archive/"
  name "CHIRP"
  desc "Tool for programming amateur radio"
  homepage "https://chirp.danplanet.com/projects/chirp/wiki/Home"

  livecheck do
    url "https://github.com/homebrew-sdr/chirpmyradio-archive"
    regex(/v?(\d+(?:\.\d+)*)/i)
  end

  conflicts_with cask: "chirp"
  depends_on macos: ">= :sonoma"

  app "CHIRP.app"

  zap trash: "~/.chirp"
end
