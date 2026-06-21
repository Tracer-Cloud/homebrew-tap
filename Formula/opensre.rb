class Opensre < Formula
  desc "Open-source SRE agent for automated incident investigation and root cause analysis"
  homepage "https://github.com/Tracer-Cloud/opensre"
  version "2026.6.21"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-arm64.tar.gz"
      sha256 "69ac09fc8fe5a04b502bd8a3fe4065cb4749288e328d0f8a098ec8286aeec8e6"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-x64.tar.gz"
      sha256 "77d4c56c7b7a8ca330c21cfc2a7e2662de3515adbc698dbfd200ce449d32ea15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-arm64.tar.gz"
      sha256 "9d10647e02b68b6a396658b860be33b810e3c872c66d5d4575fd23874477fca5"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-x64.tar.gz"
      sha256 "d4f79fa5d750614c8611e0bb3feadf434b7e6b212a28e9a3d99457baf16e8c23"
    end
  end

  def install
    bin.install "opensre"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opensre --version")
  end
end
