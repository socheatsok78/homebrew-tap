class M17Fme < Formula
  desc "Standalone M17 Project Voice and Data Packet Encoder and Decoder"
  homepage "https://github.com/lwvmobile/m17-fme"
  url "https://github.com/lwvmobile/m17-fme.git",
      revision: "2f2aad6c0e62ba2bcfbef4ffbf9b69ccd77403e8"
  version "2025-10-06"
  sha256 "652ae2d2232dcbcfbcabd88942663baf3c56139ef7d7861a5625b80b8d26f467"
  license "GPL-3.0-only"
  head "https://github.com/lwvmobile/m17-fme.git", branch: "main"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/m17-fme-2025-10-06"
    sha256 cellar: :any, arm64_tahoe:   "213257ab700e9a46a94c4651f560bdd9f45a18abbd36fa716c3004513155dfb8"
    sha256 cellar: :any, arm64_sequoia: "7cbd45f7cc2c53327104347f762443cdaf803e1a0326611671e7bcf588719137"
    sha256 cellar: :any, arm64_sonoma:  "483d0cfba11f0564d1a0321624ffa580fc54e2ca75bbf87d2cf3171f9f67b2f6"
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
