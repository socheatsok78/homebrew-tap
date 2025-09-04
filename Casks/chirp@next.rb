cask "chirp@next" do
  version "20250829"
  sha256 "fba6a7fed280a77c8d641ec5109a2bcddc821a4c1b186f95782f25de077edd02"

  url "https://archive.chirpmyradio.com/chirp_next/next-#{version}/chirp-next-#{version}.app.zip",
      verified:   "archive.chirpmyradio.com/",
      referer:    "https://archive.chirpmyradio.com/chirp_next/next-#{version}/",
      user_agent: :fake
  name "CHIRP"
  desc "Tool for programming amateur radio"
  homepage "https://chirp.danplanet.com/projects/chirp/wiki/Home"

  livecheck do
    url "https://archive.chirpmyradio.com/chirp_next/"
    regex(/next[._-]v?(\d+(?:\.\d+)*)/i)
  end

  conflicts_with cask: "chirp"
  depends_on macos: ">= :high_sierra"

  app "CHIRP.app"

  zap trash: "~/.chirp"
end
