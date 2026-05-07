class DsdFme < Formula
  desc "Digital Speech Decoder - Florida Man Edition"
  homepage "https://github.com/lwvmobile/dsd-fme"
  url "https://github.com/lwvmobile/dsd-fme.git",
      revision: "ed1d1d630ce79db890bbf4b890317341bc5aa580"
  version "2026-03-28"
  license "ISC"
  head "https://github.com/lwvmobile/dsd-fme.git", branch: "audio_work"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/dsd-fme-2026-03-28"
    sha256 cellar: :any, arm64_tahoe:   "81f86c14db153e1d2f8ab6a08ff9949917f10587f05301fbe50a137bdc7bbbdf"
    sha256 cellar: :any, arm64_sequoia: "c4cff544e43c40d709a2d23db860924232db60618e13152b804f399f6e383980"
    sha256 cellar: :any, arm64_sonoma:  "981643555db86f5de888a896dfbb3948e9bf266d96fdeeb68fcace66e1fc3c5e"
  end

  # no_autobump! because: :requires_manual_review

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "codec2"
  depends_on "librtlsdr"
  depends_on "libsndfile"
  depends_on "ncurses"
  depends_on "pulseaudio"
  depends_on "socheatsok78/tap/mbelib-lwvmobile"

  on_macos do
    depends_on "llvm@17" if DevelopmentTools.clang_build_version <= 1500
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
