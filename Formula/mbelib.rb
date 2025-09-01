class Mbelib < Formula
  desc "Full Rate and Half Rate Radio Vocoder"
  homepage "https://github.com/lwvmobile/mbelib"
  url "https://github.com/lwvmobile/mbelib/archive/refs/heads/ambe_tones.tar.gz"
  version "latest"
  sha256 "885e2886a49646d4ab9667aae351e0a4a294505f619b6ed8393415e1607c66b9"
  license "ISC"
  head "https://github.com/lwvmobile/mbelib.git", branch: "ambe_tones"

  # no_autobump! because: :requires_manual_review

  depends_on "cmake" => :build
  conflicts_with "mbelib", because: "both install `libmbe.dylib`"

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
