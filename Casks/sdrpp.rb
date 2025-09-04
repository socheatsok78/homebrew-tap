cask "sdrpp" do
  arch arm: "arm", intel: "intel"

  version "1.2.1"
  sha256 arm:   "da9db2f998421b96876e4f8cced310050e1aabf4ac295eed8dfbd17275348744",
         intel: "0efed2a5bdf7b0ac9ec99f1981b4bc3437cc6185676f080b39ef758c69d6ad11"

  url "https://github.com/AlexandreRouma/SDRPlusPlus/releases/download/nightly/sdrpp_macos_#{arch}.zip"
  name "sdrpp"
  desc "Cross-Platform SDR Software"
  homepage "https://github.com/AlexandreRouma/SDRPlusPlus"

  suite "SDR++.app"

  zap trash: "~/Library/Application Support/sdrpp"
end
