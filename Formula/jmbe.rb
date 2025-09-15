class Jmbe < Formula
  desc "Java AMBE/IMBE audio decoder"
  homepage "https://github.com/DSheirer/jmbe"
  version = "1.0.9"
  url "https://github.com/DSheirer/jmbe/archive/refs/tags/v#{version}.tar.gz"
  sha256 "ed7eff0a31067b3a328f1874157a22c156d4ecb1d9f08ea2bc732f63daf19f61"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/jmbe-1.0.9"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "9d16b5faa1215029027e3571ce447ca85ca7efd76265a5459b6d65604a2005bd"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cdc23c2f750a465a7f66f7c2c313d50309e495b5588407e934f23836c6f28644"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "69bc0f1a6774ac92e0d59a1577edf6084e4be6730bcff4e6d30f9547f8418361"
  end

  depends_on "openjdk@11" => :build

  def install
    system "./gradlew", "build"
    libexec.install "codec/build/libs/jmbe-#{version}.jar"
  end

  def caveats
    <<~EOS
      Audio conversion library for decoding MBE encoded audio frames.
      Decodes IMBE 144-bit and AMBE 72-bit encoded 20 millisecond audio frames to 8 kHz 16-bit mono PCM encoded audio.

      PATENT NOTICE
      ---
      This source code is provided for educational purposes only. It is a written description of how certain voice encoding/decoding algorithms could be implemented. Executable objects compiled or derived from this package may be covered by one or more patents. Readers are strongly advised to check for any patent restrictions or licensing requirements before compiling or using this source code.
      Note: this patent notice is verbatim from the mbelib library README at (https://github.com/szechyjs/mbelib)

      The compiled JMBE library will be located at:
        #{libexec}/jmbe-#{version}.jar
    EOS
  end

  test do
    system "true"
  end
end
