class Lockrun < Formula
  desc "Run cron jobs with overrun protection"
  homepage "http://unixwiz.net/tools/lockrun.html"
  url "http://unixwiz.net/tools/lockrun.c"
  version "1.1.3"
  sha256 "cea2e1e64c57cb3bb9728242c2d30afeb528563e4d75b650e8acae319a2ec547"
  license :public_domain

  # The upstream website doesn't publish version information, so we check the
  # version history comment in `lockrun.c` itself.
  livecheck do
    url :stable
    regex(%r{v?(\d+(?:\.\d+)+)\s+\d{4}[/-]\d{2}[/-]\d{2}}i)
  end

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/lockrun-1.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "589305a6ffd21cfe832c5c092e15dcf0df9b3a6a6684d1182468c093a5d3054c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d7f491403cd267d0a1fb0f0acde1236cf50b265390d1117f3855d876eefb735c"
    sha256 cellar: :any_skip_relocation, ventura:       "9d3172d2e1f1725b900e6b2c81545159aef2a4fd243867c0551b564f82b0fc1b"
  end

  def install
    system ENV.cc, "lockrun.c", "-o", "lockrun"
    bin.install "lockrun"
  end

  test do
    system bin/"lockrun", "--version"
  end
end
