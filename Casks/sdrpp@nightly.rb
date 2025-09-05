cask "sdrpp@nightly" do
  arch arm: "arm", intel: "intel"

  version "nightly"
  sha256 :no_check

  url "https://github.com/AlexandreRouma/SDRPlusPlus/releases/download/nightly/sdrpp_macos_#{arch}.zip"
  name "SDR++"
  desc "Cross-Platform SDR Software"
  homepage "https://github.com/AlexandreRouma/SDRPlusPlus"

  livecheck do
    url "https://github.com/AlexandreRouma/SDRPlusPlus"
    strategy :github_latest
  end

  suite "SDR++.app"

  zap trash: "~/Library/Application Support/sdrpp"
end
