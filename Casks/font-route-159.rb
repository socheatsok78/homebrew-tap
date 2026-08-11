cask "font-route-159" do
  version :latest
  sha256 :no_check

  url "https://www.1001fonts.com/download/route-159.zip"
  name "Route 159"
  desc "Route 159 Font Family"
  homepage "https://www.1001fonts.com/route-159-font.html"

  livecheck do
    skip "No version information available"
  end

  font "route159_110/Route159-Bold.otf"
  font "route159_110/Route159-BoldItalic.otf"
  font "route159_110/Route159-Heavy.otf"
  font "route159_110/Route159-HeavyItalic.otf"
  font "route159_110/Route159-Italic.otf"
  font "route159_110/Route159-Light.otf"
  font "route159_110/Route159-LightItalic.otf"
  font "route159_110/Route159-Regular.otf"
  font "route159_110/Route159-SemiBold.otf"
  font "route159_110/Route159-SemiBoldItalic.otf"
  font "route159_110/Route159-UltraLight.otf"
  font "route159_110/Route159-UltraLightItalic.otf"

  # No zap stanza required
end
