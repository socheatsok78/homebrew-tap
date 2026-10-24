class Certstrap < Formula
  desc "Tools to bootstrap CAs, certificate requests, and signed certificates"
  homepage "https://github.com/socheatsok78/certstrap"
  url "https://github.com/socheatsok78/certstrap/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "7a016b02ad2fbf6a1c6dd010561b6bfe16add5e58d039db5d9ad8fcd724657e8"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/certstrap-latest"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "12e5a94f205fb530571f5c265e4c5d81232e19c055b0af25dd14f236dfb880ef"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "29d8f8a68924d1d53b9fb5ab2a927780c778cc37d754ff32c8739497a61993c9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "f3a5855e01539791eaf3764caf787946db1f929b61c725468abb89d400296261"
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
