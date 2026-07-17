class Opensre < Formula
  desc "Open-source SRE agent for automated incident investigation and root cause analysis"
  homepage "https://github.com/Tracer-Cloud/opensre"
  version "0.1.2026.7.17"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-arm64.tar.gz"
      sha256 "6fce0d285edb63b55e55df15b056a4fc7dcd7ccd153cddb4a9dff9975599d03d"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-x64.tar.gz"
      sha256 "b4932e245a592cf8be56625b08b7b610ef5b896f7ee9bd53779cd0269513f36f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-arm64.tar.gz"
      sha256 "df7d66efd383f94d3d1a7f8432c1e21d8b9e4cae50b90087f1174b8fb5a3a940"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-x64.tar.gz"
      sha256 "49e78105e3b85bc29d1ed732595a82d73f3f75befcc70396800dd1b16ad0432a"
    end
  end

  def install
    bin.install "opensre"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opensre --version")
  end
end
