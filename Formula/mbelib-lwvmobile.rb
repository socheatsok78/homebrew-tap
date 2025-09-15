class MbelibLwvmobile < Formula
  desc "Full Rate and Half Rate Radio Vocoder"
  homepage "https://github.com/lwvmobile/mbelib"
  url "https://github.com/lwvmobile/mbelib.git",
      revision: "30dc79074ca022366a27d705b8023011d9600339"
  version "2022-08-25"
  license "ISC"
  head "https://github.com/lwvmobile/mbelib.git", branch: "ambe_tones"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/mbelib-lwvmobile-2022-08-25"
    rebuild 2
    sha256 cellar: :any, arm64_tahoe:   "ca4556f83167b511756d8cad384608572107d41abd20bd4d7e7a40940bcc438a"
    sha256 cellar: :any, arm64_sequoia: "a5ff2c14182f426dbdc6685c2d79af4d16274f28f47d344bfa967d850a83f3fe"
    sha256 cellar: :any, arm64_sonoma:  "0aa84e285d242c164e55cbeaf2495a71c2d307c3a231e4b945521f7cea46172c"
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
