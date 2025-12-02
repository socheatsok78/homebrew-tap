class Sshpass < Formula
  desc "Tool for non-interactivly performing password authentication with SSH"
  homepage "https://sourceforge.net/projects/sshpass"
  url "https://downloads.sourceforge.net/project/sshpass/sshpass/1.10/sshpass-1.10.tar.gz"
  sha256 "ad1106c203cbb56185ca3bad8c6ccafca3b4064696194da879f81c8d7bdfeeda"
  license "GPL-2.0-only"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/sshpass-1.10"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "48303385502b547ca6e41b4187b18500c65c01d52dfc20ec1bf6f007f956bd57"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6017d162f964e81f514205c8e805858ba18d24c57e6f86647a6971d82cd324bf"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ffac544a5747b7e43a55c383fd818f173ddde4e5412fa6b35b7c5a64e131ce99"
  end

  def install
    system "./configure", *std_configure_args
    system "make", "install"
  end

  def caveats
    <<~EOS
      Sshpass is a tool for non-interactively performing password authentication
      with SSH's so called "interactive keyboard password authentication".
      Most users should use SSH's more secure public key authentication instead.

      See `man sshpass` for more information.
    EOS
  end

  test do
    output = shell_output("#{bin}/sshpass -P password ssh foo@bar ls 2>&1", 255)
    assert_match(/ssh: Could not resolve hostname bar/, output)
  end
end
