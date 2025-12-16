class M17Fme < Formula
  desc "Standalone M17 Project Voice and Data Packet Encoder and Decoder"
  homepage "https://github.com/lwvmobile/m17-fme"
  url "https://github.com/lwvmobile/m17-fme.git",
      revision: "816930a4de9cf633b6a86d78ff77cb01060fc715"
  version "2025-11-28"
  license "GPL-3.0-only"
  head "https://github.com/lwvmobile/m17-fme.git", branch: "main"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/m17-fme-2025-11-28"
    sha256 cellar: :any, arm64_tahoe:   "f85c994880e8d443ebf5f1bfc0d0446ae58c6e52a2146d278be189e1d105c4b1"
    sha256 cellar: :any, arm64_sequoia: "c7bbb833615104341c319999c72b8ce58f326807c4f6e416819c4dc1c7d6e116"
    sha256 cellar: :any, arm64_sonoma:  "0f1b9a6bf7a585772e11fa0ac710cf0bc2593f942a7d7ff08d8647ac62169ac5"
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
