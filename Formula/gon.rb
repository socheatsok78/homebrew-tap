class Gon < Formula
  desc "Sign, notarize, and package macOS CLI applications written in any language"
  homepage "https://github.com/mitchellh/gon"
  url "https://github.com/mitchellh/gon/archive/refs/heads/master.tar.gz"
  version "0.2.5"
  sha256 "b2a2f744bb72aaf396399c75b0215078b6ce9d5519644bfce3a2a05f2f02923a"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  patch do
    url "https://github.com/mitchellh/gon/compare/master...winash:go-notarize:master.patch"
    sha256 "b6d8a86aa069c119f960a37cec61428fa5b90ec3ddb5c6b679a6a6775ea86e00"
  end

  def install
    system "go", "build", "-ldflags", "-s -w -X main.version=#{version}", "-trimpath", "-o", bin/"gon", "./cmd/gon"
    prefix.install_metafiles
  end

  test do
    system "#{bin}/gon", "--version"
  end
end
