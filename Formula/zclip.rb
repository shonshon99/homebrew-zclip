class Zclip < Formula
  desc "Persistent clipboard history daemon for macOS"
  homepage "https://github.com/shonshon99/zclip"
  url "https://github.com/shonshon99/zclip/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9066ee2bf13e2c209e13644be0ae31e1f57e2a779fed841375c4a6d496666fd5"
  license "MIT"

  depends_on "zig" => :build
  depends_on :macos

  def install
    # build.zig's installArtifact honors --prefix, dropping the binary in
    # #{prefix}/bin/zclip. --release=fast for an optimized (non-Debug) build.
    system "zig", "build", "--release=fast", "--prefix", prefix
  end

  test do
    # No recognized subcommand prints the usage banner and exits 2.
    assert_match "persistent clipboard history", shell_output("#{bin}/zclip --help", 2)
  end
end
