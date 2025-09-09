class M17Fme < Formula
  desc "Standalone M17 Project Voice and Data Packet Encoder and Decoder"
  homepage "https://github.com/lwvmobile/m17-fme"
  url "https://github.com/lwvmobile/m17-fme.git",
      revision: "13c93705ef988e8b3514a5bf83dc9cdded39ed79"
  version "2025-09-08"
  sha256 "652ae2d2232dcbcfbcabd88942663baf3c56139ef7d7861a5625b80b8d26f467"
  license "AGPL-3.0-only"
  head "https://github.com/lwvmobile/m17-fme.git", branch: "main"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/m17-fme-2025-09-08"
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: "faa3dec5d0393653c16c9eed548eccc47978654852619e1135ca92c24ae2d726"
    sha256 cellar: :any, arm64_sonoma:  "8204a44163a194d2fa24859a880c7ea89da8ee933ae95e8a218c7884c1aca009"
    sha256 cellar: :any, ventura:       "ece742d7a04d8af6d19cfc9a617899b70096bf17f826240a27adc896a8fa134a"
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
