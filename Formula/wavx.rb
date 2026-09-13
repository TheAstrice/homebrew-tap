class Wavx < Formula
  desc "Fast WAV inspection, validation, comparison, and simple DSP"
  homepage "https://github.com/TheAstrice/wavx"
  url "https://github.com/TheAstrice/wavx/releases/download/v0.5.0/wavx-0.5.0.tar.gz"
  sha256 "c3ccba051d14f81fbcd4d8514764f670ca0851a74b5ff38e21c3769c228ccce5"
  license "MIT"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, "-DBUILD_TESTING=OFF"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "wavx 0.5.0", shell_output("#{bin}/wavx --version")
  end
end
