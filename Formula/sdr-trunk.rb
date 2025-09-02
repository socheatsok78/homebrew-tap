class SdrTrunk < Formula
  desc "Decode, monitor, record and stream trunked radio using Software Defined Radios"
  homepage "https://github.com/DSheirer/sdrtrunk"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/sdr-trunk-0.6.1"
    sha256 cellar: :any, arm64_sequoia: "126f8057aeca85e73c0d610101110ea0b4af2790a45f8a96ec4382bb9af9766a"
    sha256 cellar: :any, arm64_sonoma:  "19d551290c534f6d6a3f0b1980102fd44eb57861710ca8d084755e520c5486e1"
    sha256 cellar: :any, ventura:       "2a1ce2c7067b5b49fd868ce778437ba30a194641723de9f030d8aa3c0b52025d"
  end

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
