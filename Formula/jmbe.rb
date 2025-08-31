class Jmbe < Formula
  desc "Java AMBE/IMBE audio decoder"
  homepage "https://github.com/DSheirer/jmbe"
  url "https://github.com/DSheirer/jmbe/archive/refs/tags/v1.0.9.tar.gz"
  sha256 "ed7eff0a31067b3a328f1874157a22c156d4ecb1d9f08ea2bc732f63daf19f61"
  license "AGPL-3.0-only"

  # depends_on "gradle@7" => :build
  depends_on "openjdk@11" => :build

  def install
    system "./gradlew", "build"
    libexec.install "codec/build/libs/jmbe-1.0.9.jar" => "jmbe.jar"
  end

  test do
    system "true"
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
        #{libexec}/jmbe.jar
    EOS
  end
end
