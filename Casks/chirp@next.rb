cask "chirp@next" do
  version "20260626"
  sha256 "3a7bc4bfd390895179dec265a42f30dab2813b2e88307d20accdd112cca5dc6d"

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
  depends_on macos: :sonoma

  app "CHIRP.app"

  zap trash: "~/.chirp"
end
