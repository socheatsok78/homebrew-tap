class Quill < Formula
  desc "Simple mac binary signing from any platform"
  homepage "https://github.com/anchore/quill"
  url "https://github.com/anchore/quill/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "e550da366c87be04ac13260c769f8a593a4a49432136a2b152a69e43b98c20f0"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/quill-0.5.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "d8848e8bedcdf3b38bf4d5d3d7bdd1e7c0b268eb9d582ae72c4ba0c0e21e780f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "05b27d14eb676358387f6f16cf1cd80e0eb6e6d63a5a95be061224e777479cea"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d7567a9f37d3cee60dc5ef5ba37fb4330de429bf82aad80c41f135e075b2aa6f"
  end

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
