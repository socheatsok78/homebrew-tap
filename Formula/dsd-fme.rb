class DsdFme < Formula
  desc "Digital Speech Decoder - Florida Man Edition"
  homepage "https://github.com/lwvmobile/dsd-fme"
  url "https://github.com/lwvmobile/dsd-fme.git",
      revision: "9acd8c981e56096197a198df5bfa5c8e5cfbaa3a"
  version "2025.09.02"
  license "Unlicense"
  head "https://github.com/lwvmobile/dsd-fme.git", branch: "audio_work"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/dsd-fme-latest"
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: "3cac20b93c66edfcbd0ffa656223a9f61b224426583e4160026af1580040485d"
    sha256 cellar: :any, arm64_sonoma:  "2b76de28110f7a92ee41dc492e662d4ff877ad2f18695689c05ef16a5d29d971"
    sha256 cellar: :any, ventura:       "cf0fd313d34db912c8691f383c6562c8f659cc22c2b529632fea650c9dff295d"
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
