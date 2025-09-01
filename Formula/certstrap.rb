class Certstrap < Formula
  desc "Tools to bootstrap CAs, certificate requests, and signed certificates"
  homepage "https://github.com/socheatsok78/certstrap"
  version "latest"
  url "https://github.com/socheatsok78/certstrap/archive/refs/heads/master.tar.gz"
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
