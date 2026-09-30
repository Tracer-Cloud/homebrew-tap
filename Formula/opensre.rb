class Opensre < Formula
  desc "Open-source SRE agent for automated incident investigation and root cause analysis"
  homepage "https://github.com/Tracer-Cloud/opensre"
  version "0.1.2026.9.30"
  license "Apache-2.0"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-arm64.tar.gz"
      sha256 "03ab6f5c8490ef841c317d201ae90fb23b21ccbac567608c6fe2a08953e7b65c"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-x64.tar.gz"
      sha256 "73509c194a0fd3708005fe8d3d58b7d18ab3685c6c8265046d035af6fceedcdc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-arm64.tar.gz"
      sha256 "e86f8218ef692fcf4d24731b7e0f2466de8d7a3ddd3f5ee59442700404b2f0c2"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-x64.tar.gz"
      sha256 "3525e043b5763a48b2a4030e2134b0ed9be793891bea8a6594667e145a1c37c6"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"opensre"
  end

  test do
    assert_path_exists libexec/"_internal"
    assert_match version.to_s, shell_output("#{bin}/opensre --version")
    system bin/"opensre", "_package-smoke"
  end
end
