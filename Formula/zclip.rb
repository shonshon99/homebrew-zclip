class Zclip < Formula
  desc "Persistent clipboard history daemon for macOS"
  homepage "https://github.com/shonshon99/zclip"
  url "https://github.com/shonshon99/zclip/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "489da5caa2434a11c3131ca7e75641ac995d0919eb811788bab3a3147c8835d5"
  license "MIT"

  depends_on "zig" => :build
  depends_on :macos

  def install
    # build.zig's installArtifact honors --prefix, dropping the binary in
    # #{prefix}/bin/zclip. --release=fast for an optimized (non-Debug) build.
    system "zig", "build", "--release=fast", "--prefix", prefix
  end

  test do
    # --help prints the usage banner and exits 0.
    assert_match "persistent clipboard history", shell_output("#{bin}/zclip --help")
  end
end
