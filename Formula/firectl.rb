class Firectl < Formula
  desc "CLI tool for managing Fireworks deployments"
  homepage "https://readme.fireworks.ai/reference/firectl"

  # Replace with the correct tagged source tarball and sha256 for releases
  # Example:
  # url "https://github.com/fw-ai/fireworks/archive/refs/tags/vX.Y.Z.tar.gz"
  # sha256 "REPLACE_WITH_SHA256"
  head "https://github.com/fw-ai/fireworks.git", branch: "main"

  depends_on "go" => :build
  depends_on "rust" => :build

  def install
    # Build Go CLI
    cd "fireworks/firectl" do
      system "go", "build", "-trimpath", "-o", bin/"firectl", "./cmd/firectl"

      # Build Rust helper
      cd "tools/safetensors-metadata" do
        system "cargo", "build", "--release"
        bin.install "target/release/safetensors-metadata"
      end
    end
  end

  test do
    # firectl should print a version or help text successfully
    assert_match "", shell_output("#{bin}/firectl version")

    # safetensors-metadata without args should show usage and exit non-zero
    output = shell_output("#{bin}/safetensors-metadata 2>&1", 1)
    assert_match "usage: safetensors-metadata", output
  end
end
