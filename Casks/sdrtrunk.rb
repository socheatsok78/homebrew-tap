cask "sdrtrunk" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.6.1"
  sha256 arm:   "6f381c509d036b1b0779f9094aa6e22b54705dfcf4dfc28a21c8557e487816f7",
         intel: "345c03866ebefe37dbfc964a0338fab3f28955837ffea1a2495ea20c1fd1d5c3"

  url "https://github.com/DSheirer/sdrtrunk/releases/download/v#{version}/sdr-trunk-osx-#{arch}-v#{version}.zip"
  name "SDRTrunk"
  desc "Decode, monitor, record and stream trunked radio using Software Defined Radios"
  homepage "https://github.com/DSheirer/sdrtrunk"

  livecheck do
    url "https://github.com/DSheirer/sdrtrunk"
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on formula: "socheatsok78/tap/jmbe"

  suite "sdr-trunk-osx-#{arch}-v#{version}"
  binary "#{appdir}/sdr-trunk-osx-#{arch}-v#{version}/bin/sdr-trunk"

  zap trash: "~/SDRTrunk"

  caveats do
    <<~EOS
      A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using Software Defined Radios (SDR)

      JMBE version 1.0.9+ is required for decoding APCO25 Phase 1/2 and DMR digital audio.

      To run the application, run the following command:
        $ sdr-trunk
      or, if that doesn't work,
        $ #{appdir}/sdr-trunk-osx-#{arch}-v#{version}/bin/sdr-trunk
    EOS
  end
end
