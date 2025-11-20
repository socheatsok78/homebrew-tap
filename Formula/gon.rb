class Gon < Formula
  desc "Sign, notarize, and package macOS CLI applications written in any language"
  homepage "https://github.com/mitchellh/gon"
  url "https://github.com/mitchellh/gon/archive/refs/heads/master.tar.gz"
  version "0.2.5"
  sha256 "b2a2f744bb72aaf396399c75b0215078b6ce9d5519644bfce3a2a05f2f02923a"
  license "MIT"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/gon-0.2.5"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "6626bfdf9f7ff842472448c305eac33571c7f60064ebdd528af1699a5304f10c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "64aa982d5fd5af0f116d8866995fec4752e6532b11e9dc4d5804cf0331488a4f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "845a99710435abd5061a5235302dec87a3bc23b1697eb6293f27ad8e6d9805a9"
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
