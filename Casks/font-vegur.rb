cask "font-vegur" do
  version "0701"
  sha256 "cfb06f0860aae4a6ed0ffaba4ab749a7c09c7f482e68a284a6f832c8382669ed"

  url "https://dotcolon.net/files/fonts/vegur_#{version}.zip"
  name "font-vegur"
  desc "Vegur is a humanist sans-serif font developed for the dot colon logotype"
  homepage "https://dotcolon.net/fonts/vegur"

  livecheck do
    skip "No version information available"
  end

  font "Vegur-Bold.otf"
  font "Vegur-Light.otf"
  font "Vegur-Regular.otf"

  # No zap stanza required
end
