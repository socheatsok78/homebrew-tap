class Sshpass < Formula
  desc "Tool for non-interactivly performing password authentication with SSH"
  homepage "https://sourceforge.net/projects/sshpass"
  url "https://downloads.sourceforge.net/project/sshpass/sshpass/1.10/sshpass-1.10.tar.gz"
  sha256 "ad1106c203cbb56185ca3bad8c6ccafca3b4064696194da879f81c8d7bdfeeda"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/sshpass-1.10"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "613cac96f2530cdae59b45589a67e9842f9fe5d2a69415f974ac7078ae6173e8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "03f14734bd136c187bff77a08d39233c30bd8ddffc937e46eb694ef03a4fd95e"
    sha256 cellar: :any_skip_relocation, ventura:       "2458cd3583ac0504f1a4a1e0842acdf84563ca3ba51a401f0c415ef50633a208"
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
