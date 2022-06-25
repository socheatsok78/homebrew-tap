class Certstrap < Formula
  desc "Tools to bootstrap CAs, certificate requests, and signed certificates"
  homepage "https://github.com/socheatsok78/certstrap"
  version "1.4.0"
  url "https://github.com/socheatsok78/certstrap/archive/refs/heads/master.zip"
  sha256 "dd181f7d5f2c1b8d0d60b63b6ef2d4d3b524dbe285d09dc4b87ae45afae77a31"
  license "Apache-2.0"
  
  conflicts_with "certstrap"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X main.release=#{version}", "-trimpath", "-o", bin/"certstrap"
    prefix.install_metafiles
  end

  test do
    system "#{bin}/certstrap", "init", "--common-name", "Homebrew Test CA", "--passphrase", "beerformyhorses"
  end
end
