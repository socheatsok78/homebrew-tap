cask "chirp@next" do
  version "20251212"
  sha256 "634fdb277af2864fa3d841cca82460777bf61738a21f475f15d6ddab23ce77ef"

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
