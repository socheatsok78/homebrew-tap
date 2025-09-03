cask "sparksdr" do
  arch arm: "osx.arm", intel: "osx"

  version "2.0.991"
  sha256 arm:   "74bc7c29e3146834e7276a1a8670660439442f0b7e3d7615123741524ca5c4cd",
         intel: "5f567e6d31676cafa64378d566afc21afaa388869998b2336c74588016c9ff4b"

  url "https://www.sparksdr.com/download/SparkSDR.#{version}.#{arch}.zip"
  name "SparkSDR"
  desc "Cross-platform software for amateur radio using SDR hardware"
  homepage "https://www.sparksdr.com/"

  app "SparkSDR.app"

  zap trash: "~/Library/Application Support/SparkSDR"
end
