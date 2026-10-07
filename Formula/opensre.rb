class Opensre < Formula
  desc "Open-source SRE agent for automated incident investigation and root cause analysis"
  homepage "https://github.com/Tracer-Cloud/opensre"
  version "0.1.2026.10.7"
  license "Apache-2.0"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-arm64.tar.gz"
      sha256 "a1f63fb8aa517c22d71154b313beaa983ee3db53c65c262f8840f441bce676c5"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-x64.tar.gz"
      sha256 "17669fa648335174930cd6bf93fbd61ebdae88dd8b6b613b2525420ba0c3b357"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-arm64.tar.gz"
      sha256 "68049d819c0b0e943696e71a87fe2dd3aff860dcd226919d572da3eb427efe60"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-x64.tar.gz"
      sha256 "e6f3b89c31180372590bdf4ec9138afbaf5629555d2ade431dc72a33293e3d20"
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
