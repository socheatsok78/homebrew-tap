cask "sdrpp@reloaded" do
  arch arm: "arm", intel: "intel"

  version "reload"
  sha256 :no_check

  url "https://github.com/socheatsok78/SDRPlusPlus/releases/download/nightly/sdrpp_macos_#{arch}.zip"
  name "SDR++Reloaded"
  desc "Cross-Platform SDR Software (Reloaded)"
  homepage "https://github.com/socheatsok78/SDRPlusPlus"

  livecheck do
    url "https://github.com/socheatsok78/SDRPlusPlus"
    strategy :github_latest
  end

  suite "SDR++.app", target: "SDR++Reloaded.app"

  zap trash: "~/Library/Application Support/sdrpp"
end
