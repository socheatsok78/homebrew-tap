class Certstrap < Formula
  desc "Tools to bootstrap CAs, certificate requests, and signed certificates"
  homepage "https://github.com/socheatsok78/certstrap"
  url "https://github.com/socheatsok78/certstrap/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "7a016b02ad2fbf6a1c6dd010561b6bfe16add5e58d039db5d9ad8fcd724657e8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/certstrap-1.4.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "f1d7947b75ae2c1faa0fb48609c214a9a301d22cca5717044354a8c1a2e0bcd8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8d0d92467620dcfcacd9c8aa60cae21b1eef9a2e60d0b0cf757096b08f6f6f33"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X main.release=#{version}", "-trimpath", "-o", bin/"certstrap"
    prefix.install_metafiles
  end

  test do
    system bin/"certstrap", "init", "--common-name", "Homebrew Test CA", "--passphrase", "beerformyhorses"
  end
end
