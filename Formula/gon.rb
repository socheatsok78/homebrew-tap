class Gon < Formula
  desc "Sign, notarize, and package macOS CLI applications written in any language"
  homepage "https://github.com/mitchellh/gon"
  url "https://github.com/mitchellh/gon/archive/refs/heads/master.tar.gz"
  version "0.2.5"
  sha256 "b2a2f744bb72aaf396399c75b0215078b6ce9d5519644bfce3a2a05f2f02923a"
  license "MIT"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/gon-0.2.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "2f483c95c82d0f39198cb202d9a1b98fbf2074a3abff2706c33abe64cd321cf3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "92fb86533b04e894f216162e258fde18a52627ec5f82cd56cbff95341389c301"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "486dbf51fd2c5294c83db5ab9ff3f2338cbd22df11c1a471b81d5612e0b9fe76"
  end

  depends_on "go" => :build
  depends_on :macos

  patch do
    url "https://github.com/mitchellh/gon/compare/master...winash:go-notarize:master.patch"
    sha256 "b6d8a86aa069c119f960a37cec61428fa5b90ec3ddb5c6b679a6a6775ea86e00"
  end
  patch do
    url "https://github.com/winash/go-notarize/compare/master...socheatsok78-lab:go-notarize:master.patch"
    sha256 "84473fa5848e30e1709d8ae4160bdac45f386ae41981997684c4c4f9ab6e5f72"
  end

  def install
    system "go", "build", "-ldflags", "-s -w -X main.version=#{version}", "-trimpath", "-o", bin/"gon", "./cmd/gon"
    prefix.install_metafiles
  end

  test do
    system "#{bin}/gon", "--version"
  end
end
