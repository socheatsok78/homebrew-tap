class M17Fme < Formula
  desc "Standalone M17 Project Voice and Data Packet Encoder and Decoder"
  homepage "https://github.com/lwvmobile/m17-fme"
  url "https://github.com/lwvmobile/m17-fme.git",
      revision: "816930a4de9cf633b6a86d78ff77cb01060fc715"
  version "2025-11-28"
  license "GPL-3.0-only"
  head "https://github.com/lwvmobile/m17-fme.git", branch: "main"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/m17-fme-2025-11-11"
    sha256 cellar: :any, arm64_tahoe:   "53b044f5e9a6518c7de958ec34b5e6ae59746e2ab3980e3f542e7eee17cbbc3c"
    sha256 cellar: :any, arm64_sequoia: "8a49b4eba40c5bde274d1e29520138b4742d8f1b43f146ee712e1ddbd5787ce1"
    sha256 cellar: :any, arm64_sonoma:  "9806c624784a274e43c36b7a2a40833e6c117c836c719e6b636c1be7a0054c14"
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
