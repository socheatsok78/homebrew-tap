class MbelibLwvmobile < Formula
  desc "Full Rate and Half Rate Radio Vocoder"
  homepage "https://github.com/lwvmobile/mbelib"
  url "https://github.com/lwvmobile/mbelib.git",
      revision: "30dc79074ca022366a27d705b8023011d9600339"
  version "latest"
  sha256 "885e2886a49646d4ab9667aae351e0a4a294505f619b6ed8393415e1607c66b9"
  license "ISC"
  head "https://github.com/lwvmobile/mbelib.git", branch: "ambe_tones"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/mbelib-latest"
    sha256 cellar: :any, arm64_sequoia: "f41dff62ae02596eb56125f7bd7780315602213c2a504159f9c0ddc8dec68352"
    sha256 cellar: :any, arm64_sonoma:  "68ea3feb32f071d3950f4d31f78337248aa99739dff6fbf8bdcf5cb671dda0a6"
    sha256 cellar: :any, ventura:       "44ccd296c5d59f6f7f7e185dccd6bea39583ff68c0231c9b87e357c41d921064"
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
