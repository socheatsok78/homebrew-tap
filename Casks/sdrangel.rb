cask "sdrangel" do
  arch arm: "mac-14.7.6_arm64", intel: "mac-13.7.6_x86_64"

  version "7.22.8"
  sha256 arm:   "26fb066aa7881d2acbb596b967cd9c5837181fccd8040fbcb0218a8ecfa694a8",
         intel: "f221b5ee5faaefc4c656625765b6126d5d36318677579674163010a1d57c7574"

  url "https://github.com/f4exb/sdrangel/releases/download/v#{version}/sdrangel-#{version}_#{arch}.dmg",
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
