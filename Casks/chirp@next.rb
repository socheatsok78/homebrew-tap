cask "chirp@next" do
  version "20260501"
  sha256 "c3a08ff26d2e251e751b0c2880639e0bdfc70ef4672a09e1e4a7ca8aff7d71e2"

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
  depends_on macos: ">= :sonoma"

  app "CHIRP.app"

  zap trash: "~/.chirp"
end
