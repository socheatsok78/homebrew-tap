class Dsd < Formula
  desc "Digital Speech Decoder"
  homepage "https://github.com/szechyjs/dsd"
  license "Unlicense"
  head "https://github.com/szechyjs/dsd.git", branch: "master"

  stable do
    url "https://github.com/szechyjs/dsd/archive/refs/tags/v1.6.0.tar.gz"
    sha256 "44fa3ae108d2c11b4b67388d37fc6a63e8b44fc72fdd5db7b57d9eb045a9df58"

    patch do
      # Fixes build on macOS.
      url "https://github.com/szechyjs/dsd/commit/e40c32d8addf3ab94dae42d8c0fcf9ef27e453c2.patch?full_index=1"
      sha256 "03ed4655ad7be32f3a344fd7274ddf3b192e11f9c2194d59119f76e14b6bebc2"
    end
  end

  # no_autobump! because: :requires_manual_review

  depends_on "cmake" => :build
  depends_on "itpp"
  depends_on "libsndfile"
  depends_on "llvm@14"
  depends_on "mbelib"
  depends_on "portaudio"

  def install
    args = []

    if OS.mac?
      llvm = Formula["llvm@14"]

      ENV["CC"] = llvm.opt_bin/"clang"
      ENV["CXX"] = llvm.opt_bin/"clang++"

      # Avoid ending up with llvm's Cellar path hard coded.
      ENV["CLANG_FORMAT"] = llvm.opt_bin/"clang-format"

      # When using Homebrew's superenv shims, we need to use HOMEBREW_LIBRARY_PATHS
      # rather than LDFLAGS for libc++ in order to correctly link to LLVM's libc++.
      ENV.prepend_path "HOMEBREW_LIBRARY_PATHS", llvm.opt_lib/"c++"

      args << "-DCMAKE_CXX_FLAGS=-std=c++14"
      args << "-DINSIGHTS_LLVM_CONFIG=#{llvm.opt_bin}/llvm-config"
      args << "-DINSIGHTS_USE_SYSTEM_INCLUDES=OFF"
    end

    system "cmake", ".", *args, *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"dsd", "-h"
  end
end
