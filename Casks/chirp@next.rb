cask "chirp@next" do
  version "20250905"
  sha256 "9f24be446fb663648904e4ea16798fb896040b5ed35bfb6f3f1850fac8b2c65c"

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
