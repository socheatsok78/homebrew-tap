class Quill < Formula
  desc "Simple mac binary signing from any platform"
  homepage "https://github.com/anchore/quill"
  url "https://github.com/anchore/quill/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "e550da366c87be04ac13260c769f8a593a4a49432136a2b152a69e43b98c20f0"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", "-ldflags", "-s -w -X main.version=#{version}", "-trimpath", "-o", bin/"quill", "./cmd/quill"
    prefix.install_metafiles
  end

  test do
    system "#{bin}/quill", "--version"
  end
end
