class Opensre < Formula
  desc "Open-source SRE agent for automated incident investigation and root cause analysis"
  homepage "https://github.com/Tracer-Cloud/opensre"
  version "2026.6.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-arm64.tar.gz"
      sha256 "68fc8d5aff5ee61f3e86660c41c80d1ff92b9a3dacdc9a32e6e1800d175a3af5"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-x64.tar.gz"
      sha256 "e621e75bc4a21f545867539f57a5f7e83847a5c8dd5e2a6e138454bcb293d730"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-arm64.tar.gz"
      sha256 "55711c80abc4bc02e851a5fdce2c9d967647c0897c44fb34f8a0f10088ae6654"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-x64.tar.gz"
      sha256 "477abfd26707aa0cc3ed8013e5d307f3d5fb9f79c4f964941db815ab8ddf04af"
    end
  end

  def install
    bin.install "opensre"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opensre --version")
  end
end
