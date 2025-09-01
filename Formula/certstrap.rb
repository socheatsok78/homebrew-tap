class Certstrap < Formula
  desc "Tools to bootstrap CAs, certificate requests, and signed certificates"
  homepage "https://github.com/socheatsok78/certstrap"
  url "https://github.com/socheatsok78/certstrap/archive/refs/heads/master.tar.gz"
  version "latest"
  sha256 "f3ca1d642e0e59ceea5f5cd44aa049fbeed67ebde1051f0dd35cd0f3573a6884"
  license "Apache-2.0"

  depends_on "go" => :build
  conflicts_with "certstrap"

  def install
    system "go", "build", "-ldflags", "-s -w -X main.release=#{version}", "-trimpath", "-o", bin/"certstrap"
    prefix.install_metafiles
  end

  test do
    system "#{bin}/certstrap", "init", "--common-name", "Homebrew Test CA", "--passphrase", "beerformyhorses"
  end
end
