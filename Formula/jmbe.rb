class Jmbe < Formula
  desc "Java AMBE/IMBE audio decoder"
  homepage "https://github.com/DSheirer/jmbe"
  version = "1.0.9"
  url "https://github.com/DSheirer/jmbe/archive/refs/tags/v#{version}.tar.gz"
  sha256 "ed7eff0a31067b3a328f1874157a22c156d4ecb1d9f08ea2bc732f63daf19f61"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/jmbe-1.0.9"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a4f9d6324a5d840f8a636ab5fe0a906bf3609b9fec175d679f180332cc4d6633"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "dbc6d19300be8e1f332d961433ed7142815b41df21d409b107a7e8342612f44a"
    sha256 cellar: :any_skip_relocation, ventura:       "bb6e2309ac32d767e1946cd7b0324da11fb4c444efdbe3ed2c272f408611554e"
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
