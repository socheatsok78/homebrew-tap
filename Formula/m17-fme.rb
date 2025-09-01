class M17Fme < Formula
  desc "Standalone M17 Project Voice and Data Packet Encoder and Decoder"
  homepage "https://github.com/lwvmobile/m17-fme"
  version "latest"
  url "https://github.com/lwvmobile/m17-fme/archive/refs/heads/main.tar.gz"
  sha256 "652ae2d2232dcbcfbcabd88942663baf3c56139ef7d7861a5625b80b8d26f467"
  license "AGPL-3.0-only"

  depends_on "cmake" => :build
  depends_on "git" => :build
  depends_on "codec2"
  depends_on "libsndfile"
  depends_on "ncurses"
  depends_on "pkg-config"
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
