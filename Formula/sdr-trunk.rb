class SdrTrunk < Formula
  desc "Decode, monitor, record and stream trunked radio using Software Defined Radios"
  homepage "https://github.com/DSheirer/sdrtrunk"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/sdr-trunk-0.6.1"
    rebuild 2
    sha256 cellar: :any, arm64_tahoe:   "bcef1185495c9a5ca76fc6964df34a86667562a1c5c7e1e3ad5f518163d56973"
    sha256 cellar: :any, arm64_sequoia: "bf8ca781e235a00f125dcdd5e8f2463fb42e9c7cf548352811d6aced4957b138"
    sha256 cellar: :any, arm64_sonoma:  "be1d7179f9d7e3e4df1e911478cd2be9b47c2b11c5102944df0cc75a0a092559"
  end

  depends_on "gstreamer"
  depends_on "libvisual-plugins"
  depends_on "socheatsok78/tap/jmbe"

  on_macos do
    on_intel do
      url "https://github.com/DSheirer/sdrtrunk/releases/download/v0.6.1/sdr-trunk-osx-x86_64-v0.6.1.zip"
      sha256 "345c03866ebefe37dbfc964a0338fab3f28955837ffea1a2495ea20c1fd1d5c3"
    end
    on_arm do
      url "https://github.com/DSheirer/sdrtrunk/releases/download/v0.6.1/sdr-trunk-osx-aarch64-v0.6.1.zip"
      sha256 "6f381c509d036b1b0779f9094aa6e22b54705dfcf4dfc28a21c8557e487816f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/DSheirer/sdrtrunk/releases/download/v0.6.1/sdr-trunk-linux-x86_64-v0.6.1.zip"
      sha256 "1e87c8c8446963df62342c9f895e7669bf0a440f258d6bb1dd94485517cb7174"
    end
    on_arm do
      url "https://github.com/DSheirer/sdrtrunk/releases/download/v0.6.1/sdr-trunk-linux-aarch64-v0.6.1.zip"
      sha256 "7784ce560200cd71031d195443d18c1f452772038b96932d35e092883685cf90"
    end
  end

  def install
    libexec.install Dir["bin", "conf", "legal", "lib"]
    bin.install_symlink libexec/"bin/sdr-trunk"
    prefix.install_metafiles
  end

  def caveats
    <<~EOS
      A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using Software Defined Radios (SDR)

      JMBE version 1.0.9+ is required for decoding APCO25 Phase 1/2 and DMR digital audio.

      To run the application, run the following command:
        $ sdr-trunk
      or, if that doesn't work,
        $ #{bin}/sdr-trunk
    EOS
  end

  test do
    system "true"
  end
end
