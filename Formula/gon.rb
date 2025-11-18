class Gon < Formula
  desc "Sign, notarize, and package macOS CLI applications written in any language"
  homepage "https://github.com/mitchellh/gon"
  url "https://github.com/mitchellh/gon/archive/refs/heads/master.tar.gz"
  version "0.2.5"
  sha256 "b2a2f744bb72aaf396399c75b0215078b6ce9d5519644bfce3a2a05f2f02923a"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", "-ldflags", "-s -w -X main.version=#{version}", "-trimpath", "-o", bin/"gon", "./cmd/gon"
    prefix.install_metafiles
  end

  test do
    system "#{bin}/gon", "--version"
  end
end
