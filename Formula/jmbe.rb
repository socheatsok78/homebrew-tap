class Jmbe < Formula
  desc "Java AMBE/IMBE audio decoder"
  homepage "https://github.com/DSheirer/jmbe"
  license "AGPL-3.0-only"

  on_macos do
    on_intel do
      url "https://github.com/DSheirer/jmbe/releases/download/v1.0.9/jmbe-creator-osx-x86_64-v1.0.9.zip"
      sha256 "1ba99ce79739ba0074e4d8ad1cd86f5f3653c130b8034589e75f1dde701cbff0"
    end
    on_arm do
      url "https://github.com/DSheirer/jmbe/releases/download/v1.0.9/jmbe-creator-osx-aarch64-v1.0.9.zip"
      sha256 "cbb1e43c32acaa6b503aaf272f7589307c48e6793832b308c9ff44c1e5d025aa"
    end
  end

  def install
    system "bin/creator"
    lib.install Dir["codec/build/libs"]
  end

  test do
    system "true"
  end

  def caveats
    <<~EOS
      Audio conversion library for decoding MBE encoded audio frames.
      Decodes IMBE 144-bit and AMBE 72-bit encoded 20 millisecond audio frames to 8 kHz 16-bit mono PCM encoded audio.

      By default, binaries installed binary will be placed into:
        #{libexec}/bin/
      A symlink to the binary will be placed into:
        #{bin}/jmbe-creator
    EOS
  end
end
