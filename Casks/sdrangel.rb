cask "sdrangel" do
  arch arm: "_mac-14.8.5_arm64", intel: "_mac-15.7.5_x86_64"

  version "7.25.1"
  sha256 arm:   "08faf0ae91d3343dc8809366e464a84f0af6bf7152beba0124e654d4a65d2272",
         intel: "b2f64072c48903e03b58b1c78ca9ee47d2a84884fd7640bfc01ea3a9eb006e4a"

  url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}#{arch}.dmg",
      verified: "github.com/f4exb/sdrangel/"
  name "SDRangel"
  desc "SDR Rx/Tx software and signal analyzer frontend to various hardware"
  homepage "https://www.sdrangel.org/"

  livecheck do
    url "https://github.com/f4exb/sdrangel"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: :ventura

  app "SDRangel.app"

  zap trash: "~/Library/Application Support/f4exb/SDRangel"
end
