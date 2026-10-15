class Opensre < Formula
  desc "Open-source SRE agent for automated incident investigation and root cause analysis"
  homepage "https://github.com/Tracer-Cloud/opensre"
  version "0.1.2026.10.15"
  license "Apache-2.0"

  depends_on "gh"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-arm64.tar.gz"
      sha256 "7434954a1d6b7bb60876db5cee81ed2a97cc89ecad2aa30cb4d09c095c0fff18"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-x64.tar.gz"
      sha256 "30a607e297e370383bb8390f4e9fa3ffb7fd6d89e50b647f7d789f06798d059a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-arm64.tar.gz"
      sha256 "b091f493be7703fac525b7e2c5dc6d66586c0e1c931ad103ce5ef673396e416d"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-x64.tar.gz"
      sha256 "e28b52c8c7ec3714b9e95bbb20779c779d1fc91fb05f0785a8c2cc87409c7d5c"
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
