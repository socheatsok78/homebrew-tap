class DsdFme < Formula
  desc "Digital Speech Decoder - Florida Man Edition"
  homepage "https://github.com/lwvmobile/dsd-fme"
  url "https://github.com/lwvmobile/dsd-fme.git",
      revision: "b0a46a541d81d4fde241a82b01a982678888b8ae"
  version "2025-09-12"
  license "ISC"
  head "https://github.com/lwvmobile/dsd-fme.git", branch: "audio_work"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/dsd-fme-2025-09-02"
    rebuild 2
    sha256 cellar: :any, arm64_tahoe:   "2d7327fa05cdf1637c851f9b6e55a071840e4b62c022f8eaccaaf71876fd2303"
    sha256 cellar: :any, arm64_sequoia: "8a3559d3a21af0f3994f5d06d380359db73822284d71fa44a66bb7331f44a3bf"
    sha256 cellar: :any, arm64_sonoma:  "632af347723c3b8288660c069f033749a58a096f6e44160e6c3b756786d251d2"
  end

  # no_autobump! because: :requires_manual_review

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "codec2"
  depends_on "itpp"
  depends_on "librtlsdr"
  depends_on "libsndfile"
  depends_on "ncurses"
  depends_on "pulseaudio"
  depends_on "socheatsok78/tap/mbelib-lwvmobile"

  on_macos do
    depends_on "llvm@17" if DevelopmentTools.clang_build_version <= 1500
  end

  fails_with :clang do
    build 1500
    cause "Requires C++17"
  end

  patch do
    url "https://raw.githubusercontent.com/socheatsok78/nur/189c36df96de900297a421cdaee23ee91c4548f1/pkgs/dsd-fme/disable_oss_darwin.patch"
    sha256 "c4eeed49f25be28e82aa854e65a342c6a3c043e898172e210ee2b80c323bc3bd"
  end

  def install
    args = []

    if OS.mac? && DevelopmentTools.clang_build_version <= 1500
      llvm = Formula["llvm@17"]

      ENV["CC"] = llvm.opt_bin/"clang"
      ENV["CXX"] = llvm.opt_bin/"clang++"

      # Avoid ending up with llvm's Cellar path hard coded.
      ENV["CLANG_FORMAT"] = llvm.opt_bin/"clang-format"

      # When using Homebrew's superenv shims, we need to use HOMEBREW_LIBRARY_PATHS
      # rather than LDFLAGS for libc++ in order to correctly link to LLVM's libc++.
      ENV.prepend_path "HOMEBREW_LIBRARY_PATHS", llvm.opt_lib/"c++"

      args << "-DINSIGHTS_LLVM_CONFIG=#{llvm.opt_bin}/llvm-config"
      args << "-DINSIGHTS_USE_SYSTEM_INCLUDES=OFF"
    end

    system "cmake", ".", *args, *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"dsd-fme", "-h"
  end
end
