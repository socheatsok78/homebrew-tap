class Gon < Formula
  desc "Sign, notarize, and package macOS CLI applications written in any language"
  homepage "https://github.com/mitchellh/gon"
  url "https://github.com/mitchellh/gon/archive/refs/heads/master.tar.gz"
  version "0.2.5"
  sha256 "b2a2f744bb72aaf396399c75b0215078b6ce9d5519644bfce3a2a05f2f02923a"
  license "MIT"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/gon-0.2.5"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "752fba92d26598193b357bf9c81fa1c06f30573cec079f4aebfe798afdfa097e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f2f4b445fabe2e1d6606182307c4493b343522695ea1100ae50857cdd8c57b07"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0498bbafc71b2403137730d87d5ce8bfce335df0cd965566a466b617fc0035b6"
  end

  depends_on "go" => :build
  depends_on :macos

  patch do
    url "https://github.com/mitchellh/gon/compare/master...socheatsok78-lab:go-notarize:master.patch"
    sha256 "3b31f090b1902888b76b68d476c585d7678a3fd7a56de2c6bcee32a26bfe21bf"
  end

  def install
    system "go", "build", "-ldflags", "-s -w -X main.version=#{version}", "-trimpath", "-o", bin/"gon", "./cmd/gon"
    prefix.install_metafiles
  end

  test do
    system "#{bin}/gon", "--version"
  end
end
