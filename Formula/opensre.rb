class Opensre < Formula
  desc "Open-source SRE agent for automated incident investigation and root cause analysis"
  homepage "https://github.com/Tracer-Cloud/opensre"
  version "0.1.2026.9.29"
  license "Apache-2.0"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-arm64.tar.gz"
      sha256 "bdf66dbbcea5e2aac826c8f1e70445834feeb02025fda08732befbb03ac0d59d"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-x64.tar.gz"
      sha256 "65428e82c7a76645834413e23596bb3f0a63f9d86312246e07bc05e0dec24ca0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-arm64.tar.gz"
      sha256 "80669afbd29c656ac482882f96cc100c1a1379efdf3765912c02921a1cad658d"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-x64.tar.gz"
      sha256 "2d1dc068a1b6e3a222f7a728c88b4d305a350d53e80c2af189c5c5347657d271"
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
