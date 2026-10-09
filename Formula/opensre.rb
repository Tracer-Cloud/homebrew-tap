class Opensre < Formula
  desc "Open-source SRE agent for automated incident investigation and root cause analysis"
  homepage "https://github.com/Tracer-Cloud/opensre"
  version "0.1.2026.10.9"
  license "Apache-2.0"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-arm64.tar.gz"
      sha256 "71637bb46fd100d1db03a1b84757e3523b25fa1911f1975bfdbb8643c20e010c"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-x64.tar.gz"
      sha256 "505da2c8f9eed8bbd631bccc3fb42439ccd4854e23a275bf864541bf09232e2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-arm64.tar.gz"
      sha256 "9dffc8b1d77febe144e2060f4d9a5a5f74dc5fed3e8be773fb73ae4575f1b9d0"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-x64.tar.gz"
      sha256 "be984ac95284932b72ecbbf509a4572fa8e21257358d92e5aee6117bd50a3252"
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
