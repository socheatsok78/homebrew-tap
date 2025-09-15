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
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b1b29adc41b4669f7c5198aa6f6b152770b1d9b0898382dca775637cdb0fb4b2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "718f1132444985b448f747e6088efb8ca0df5d4531824ad6bcc7417711c8ff99"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "de82646903ffa48280f1d737e73dacd1c3f359b45e4eb6ff8cf15b58ea7593f5"
  end

  def install
    system ENV.cc, "lockrun.c", "-o", "lockrun"
    bin.install "lockrun"
  end

  test do
    system bin/"lockrun", "--version"
  end
end
