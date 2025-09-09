class MbelibLwvmobile < Formula
  desc "Full Rate and Half Rate Radio Vocoder"
  homepage "https://github.com/lwvmobile/mbelib"
  url "https://github.com/lwvmobile/mbelib.git",
      revision: "30dc79074ca022366a27d705b8023011d9600339"
  version "2022.08.25"
  license "ISC"
  head "https://github.com/lwvmobile/mbelib.git", branch: "ambe_tones"

  bottle do
    root_url "https://github.com/socheatsok78/homebrew-tap/releases/download/mbelib-lwvmobile-2022.08.25"
    sha256 cellar: :any, arm64_sequoia: "a5c8e833af451fc629c21cb3d64a65065c2428c04a9b3d26d8ab562a4ad68bc6"
    sha256 cellar: :any, arm64_sonoma:  "a12ba25aa67f3fd1081e2c7206bee86eeee48f5495c023b846daf7fc1d82bedc"
    sha256 cellar: :any, ventura:       "2801cc7b29f54fa6a59ca539fedb455016b7c0072e4347043b725757a04cd93d"
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
