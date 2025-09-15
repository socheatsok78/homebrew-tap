class Sshpass < Formula
  desc "Tool for non-interactivly performing password authentication with SSH"
  homepage "https://sourceforge.net/projects/sshpass"
  url "https://downloads.sourceforge.net/project/sshpass/sshpass/1.10/sshpass-1.10.tar.gz"
  sha256 "ad1106c203cbb56185ca3bad8c6ccafca3b4064696194da879f81c8d7bdfeeda"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/sshpass-1.10"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "23ef38f4eb892f2136e5501a00e9328392fec76b56e79a9a6536de2e288da575"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e78f894ad8438808c379f3876bf9109e4395c0977e7afc2a7e212730eb02cd63"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "dc1d517012c013a49a21105a77b2e00f503cdae1c06dc35e9f843f23ef5f675a"
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "true"
  end
end
