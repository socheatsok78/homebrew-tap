class Mbelib < Formula
  desc "Full Rate and Half Rate Radio Vocoder"
  homepage "https://github.com/lwvmobile/mbelib"
  url "https://github.com/lwvmobile/mbelib/archive/refs/heads/ambe_tones.tar.gz"
  version "latest"
  sha256 "885e2886a49646d4ab9667aae351e0a4a294505f619b6ed8393415e1607c66b9"
  license "ISC"
  head "https://github.com/lwvmobile/mbelib.git", branch: "ambe_tones"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/mbelib-latest"
    rebuild 1
    sha256 cellar: :any,                 arm64_sequoia: "29675ed6e7490223ae4b92782e18d233c4f71be0e9987717280b289fca36b2fb"
    sha256 cellar: :any,                 ventura:       "6ea53528f0d0d2e9673dd9566539a650626316f68cffcf67a65a55d8b6aea074"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5d922cf5f44fb5ac1ac353d029f96f3ae595be3c5cea07204b4ff25a4c2de19e"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath/"mb.cpp").write <<~CPP
      extern "C" {
      #include "mbelib.h"
      }
      int main() {
        float float_buf[160] = {1.23f, -1.12f, 4680.412f, 4800.12f, -4700.74f};
        mbe_synthesizeSilencef(float_buf);
        return (float_buf[0] != 0);
      }
    CPP
    system ENV.cxx, "mb.cpp", "-o", "test", "-L#{lib}", "-lmbe"
    system "./test"
  end
end
