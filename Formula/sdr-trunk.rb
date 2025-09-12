class SdrTrunk < Formula
  desc "Decode, monitor, record and stream trunked radio using Software Defined Radios"
  homepage "https://github.com/DSheirer/sdrtrunk"
  license "GPL-3.0-only"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/sdr-trunk-0.6.1"
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: "fe204f917628663c0c0afdc05ff428824b5483e8694ba4dcf8528f05284000dd"
    sha256 cellar: :any, arm64_sonoma:  "b375c9f819f5be361873421a9c7ecb3476485c27befa979fae1638dcf078879e"
    sha256 cellar: :any, ventura:       "a5c7c830d58a8f03dfa399d8987f473b5fd7972b29045983f018f8299460b4b0"
  end

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
