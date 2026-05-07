class M17Fme < Formula
  desc "Standalone M17 Project Voice and Data Packet Encoder and Decoder"
  homepage "https://github.com/lwvmobile/m17-fme"
  url "https://github.com/lwvmobile/m17-fme.git",
      revision: "6a93a2abfc706eb1bb37adc89e1659cd417a9caa"
  version "2026-01-26"
  license "GPL-3.0-only"
  head "https://github.com/lwvmobile/m17-fme.git", branch: "main"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/m17-fme-2026-01-26"
    sha256 cellar: :any, arm64_tahoe:   "de2728a1219c38eb3f04076003916abb290b1dfbb073b3904b4a6ab32b45a379"
    sha256 cellar: :any, arm64_sequoia: "d312b69118e70ed704fdf5f6463b296ff8ec1d37a973ecef13871afcd2bf0702"
    sha256 cellar: :any, arm64_sonoma:  "0ad608ddc298568e69433a53e87ae2408d4c5a4047647cbce7fbdd3dc98e122e"
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
