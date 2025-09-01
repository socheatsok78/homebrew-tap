class Sshpass < Formula
  desc "Tool for non-interactivly performing password authentication with SSH"
  homepage "https://sourceforge.net/projects/sshpass"
  url "https://sourceforge.net/projects/sshpass/files/sshpass/#{version}/sshpass-#{version}.tar.gz"
  version '1.09'
  sha256 "71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8dc48717dedc49fb7"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  def test
    system "sshpass"
  end
end
