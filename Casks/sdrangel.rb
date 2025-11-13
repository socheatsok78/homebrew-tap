cask "sdrangel" do
  arch arm: "-480-g11074ac87_mac-14.7.6_arm64", intel: "_mac-13.7.6_x86_64"

  version "7.22.9"
  sha256 arm:   "082bb21cfa74ed56a82c928c82f8a418ef9852bb5d542797e4d0ef49e20aa2c8",
         intel: "af12179ca22ed510bbef9f35e690f599b5333c7dda469c9cc077bcbf94bc3e39"

  url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}#{arch}.dmg",
      verified: "github.com/f4exb/sdrangel/"
  name "SDRangel"
  desc "SDR Rx/Tx software and signal analyzer frontend to various hardware"
  homepage "https://www.sdrangel.org/"

  livecheck do
    url "https://github.com/f4exb/sdrangel"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: ">= :ventura"

  app "SDRangel.app"

  zap trash: "~/Library/Application Support/f4exb/SDRangel"
end
