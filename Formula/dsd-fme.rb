class DsdFme < Formula
  desc "Digital Speech Decoder - Florida Man Edition"
  homepage "https://github.com/lwvmobile/dsd-fme"
  url "https://github.com/lwvmobile/dsd-fme/archive/refs/heads/audio_work.tar.gz"
  version "latest"
  sha256 "b7ebbe2e2a91e1d2db422f223b989a453f14460bcae036087da32a7efd09bef1"
  license "Unlicense"
  head "https://github.com/lwvmobile/dsd-fme.git", branch: "audio_work"

  # no_autobump! because: :requires_manual_review

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "codec2"
  depends_on "itpp"
  depends_on "librtlsdr"
  depends_on "libsndfile"
  depends_on macos: :sequoia
  depends_on "ncurses"
  depends_on "pulseaudio"
  depends_on "socheatsok78/tap/mbelib"

  patch do
    url "https://raw.githubusercontent.com/socheatsok78/nur/189c36df96de900297a421cdaee23ee91c4548f1/pkgs/dsd-fme/disable_oss_darwin.patch"
    sha256 "c4eeed49f25be28e82aa854e65a342c6a3c043e898172e210ee2b80c323bc3bd"
  end

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system bin/"dsd-fme", "-v"
  end
end
