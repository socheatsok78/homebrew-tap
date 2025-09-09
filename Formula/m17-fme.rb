class M17Fme < Formula
  desc "Standalone M17 Project Voice and Data Packet Encoder and Decoder"
  homepage "https://github.com/lwvmobile/m17-fme"
  url "https://github.com/lwvmobile/m17-fme.git",
      revision: "13c93705ef988e8b3514a5bf83dc9cdded39ed79"
  version "2025.09.08"
  sha256 "652ae2d2232dcbcfbcabd88942663baf3c56139ef7d7861a5625b80b8d26f467"
  license "AGPL-3.0-only"
  head "https://github.com/lwvmobile/m17-fme.git", branch: "main"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/m17-fme-2025.09.08"
    sha256 cellar: :any, arm64_sequoia: "476e9495a6d5889590f65696fb2e004dcb9d1c23b187608c7c1d98ecf9e4afe5"
    sha256 cellar: :any, arm64_sonoma:  "8479ea18d904662716f3a665c494b90d58b9e5dee022aebf9721f13118eaa8cc"
    sha256 cellar: :any, ventura:       "13d2c20603126cf9d3dec28636be3f7e79829c0bbb1d61824dbba4c1d8b187ec"
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
