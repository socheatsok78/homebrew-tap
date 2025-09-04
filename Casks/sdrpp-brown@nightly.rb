cask "sdrpp-brown" do
  arch arm: "arm", intel: "intel"

  version "nightly"
  sha256 :no_check

  url "https://github.com/sannysanoff/SDRPlusPlusBrown/releases/download/rolling/sdrpp_macos_#{arch}.zip"
  name "SDR++Brown"
  desc "Cross-Platform SDR Software (Brown Edition)"
  homepage "https://github.com/sannysanoff/SDRPlusPlusBrown"

  suite "SDR++Brown.app"

  zap trash: "~/Library/Application Support/sdrpp-brown"
end
