class Opensre < Formula
  desc "Open-source SRE agent for automated incident investigation and root cause analysis"
  homepage "https://github.com/Tracer-Cloud/opensre"
  version "2026.6.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-arm64.tar.gz"
      sha256 "0cde31c7cf84d7b5a5f7cba08b2bf64f0da636fbddf55524d3c3366e21127872"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-x64.tar.gz"
      sha256 "19244b17b9e9a9459d5ebf9f9eff778f2355dc12899a6113a79498b02a5a7e68"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-arm64.tar.gz"
      sha256 "7fba5b4b2d822ce753c6d3b7b35575bff5eaaa0adcac5b86ffe3b891d2b85da4"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-x64.tar.gz"
      sha256 "c88875085eec0e1187e09cbd7cdb335518d9361d2ca4e7e5513133677d813e2b"
    end
  end

  def install
    bin.install "opensre"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opensre --version")
  end
end
