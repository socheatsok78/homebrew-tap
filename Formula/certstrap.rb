class Certstrap < Formula
  desc "Tools to bootstrap CAs, certificate requests, and signed certificates"
  homepage "https://github.com/socheatsok78/certstrap"
  url "https://github.com/socheatsok78/certstrap/archive/refs/heads/master.tar.gz"
  version "latest"
  sha256 "f3ca1d642e0e59ceea5f5cd44aa049fbeed67ebde1051f0dd35cd0f3573a6884"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/certstrap-latest"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "dccea7ed2688e36bee46737f1adde94bd01b9e98010ed98b5e5e0c09e8111267"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0878f3db7edd13f81e0425b7cc2d115c91d4d1a55368028f9258a640406890e1"
    sha256 cellar: :any_skip_relocation, ventura:       "2910eaac0b96831709cdd6290ef1a391bec089f5da82b13ea0134f5d82e11ac8"
    # tahoe:
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-s -w -X main.release=#{version}", "-trimpath", "-o", bin/"certstrap"
    prefix.install_metafiles
  end

  test do
    system "#{bin}/certstrap", "init", "--common-name", "Homebrew Test CA", "--passphrase", "beerformyhorses"
  end
end
