class M17Fme < Formula
  desc "Standalone M17 Project Voice and Data Packet Encoder and Decoder"
  homepage "https://github.com/lwvmobile/m17-fme"
  url "https://github.com/lwvmobile/m17-fme.git",
      revision: "13c93705ef988e8b3514a5bf83dc9cdded39ed79"
  version "2025-09-08"
  sha256 "652ae2d2232dcbcfbcabd88942663baf3c56139ef7d7861a5625b80b8d26f467"
  license "GPL-3.0-only"
  head "https://github.com/lwvmobile/m17-fme.git", branch: "main"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/m17-fme-2025-09-08"
    rebuild 2
    sha256 cellar: :any, arm64_tahoe:   "c211675038a8c66404cb69e79effaa0506d1f12671aa7e56a61bc8c4d578b20a"
    sha256 cellar: :any, arm64_sequoia: "083a7bab0a60b72bf3f0d6e6a154a9e258a164cb351b77f4edbe3317846ca584"
    sha256 cellar: :any, arm64_sonoma:  "830a6e97deadb753ae0b8f5ca5673db6216959bdc508af6e9e1e94ea39894e44"
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
