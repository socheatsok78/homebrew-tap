class M17Fme < Formula
  desc "Standalone M17 Project Voice and Data Packet Encoder and Decoder"
  homepage "https://github.com/lwvmobile/m17-fme"
  url "https://github.com/lwvmobile/m17-fme.git",
      revision: "13c93705ef988e8b3514a5bf83dc9cdded39ed79"
  version "2025.09.08"
  sha256 "652ae2d2232dcbcfbcabd88942663baf3c56139ef7d7861a5625b80b8d26f467"
  license "AGPL-3.0-only"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/m17-fme-latest"
    sha256 cellar: :any, arm64_sequoia: "1c90935ee5abe4e1b3f475df5d32cb1141a15cd994e676e339fc68bf29054455"
    sha256 cellar: :any, arm64_sonoma:  "33ddfc4a69aab802371d09e11083fda8bee854a2b0642793416bf286753703fc"
    sha256 cellar: :any, ventura:       "47d270c37ed4fe1245ba47f38639141f1676db4bf0ed498ad2592349838e51d6"
  end

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "codec2"
  depends_on "libsndfile"
  depends_on "ncurses"
  depends_on "pulseaudio"
  depends_on "socat"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"m17-fme", "-v"
  end
end
