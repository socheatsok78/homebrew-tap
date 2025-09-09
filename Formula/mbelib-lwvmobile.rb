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
    rebuild 1
    sha256 cellar: :any, arm64_sequoia: "508eb1b00c6bd0f5de84c6c3dd2eac4bd70ee9c2d48f3e140001168e377fabee"
    sha256 cellar: :any, arm64_sonoma:  "74651cb0d433581b843db1c831983c906b69af541fb6ffd9247878315ef1aa70"
    sha256 cellar: :any, ventura:       "75f9ce9e561ca7697a929e0d07bbb04bf0d9f4b6292030d4cc7f66f32884ada0"
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
