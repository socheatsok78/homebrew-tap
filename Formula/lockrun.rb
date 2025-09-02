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

  def install
    system ENV.cc, "lockrun.c", "-o", "lockrun"
    bin.install "lockrun"
  end

  test do
    system bin/"lockrun", "--version"
  end
end
