class Certstrap < Formula
  desc "Tools to bootstrap CAs, certificate requests, and signed certificates"
  homepage "https://github.com/socheatsok78/certstrap"
  version "1.3.0"
  url "https://github.com/socheatsok78/certstrap-release/archive/refs/tags/v#{version}.tar.gz"
  sha256 "fe279178f34d9f95b6c7dc5a8a88ba3280ee79fbc09a1de0c17632e8a53673e9"
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
