class Opensre < Formula
  desc "Open-source SRE agent for automated incident investigation and root cause analysis"
  homepage "https://github.com/Tracer-Cloud/opensre"
  version "2026.6.19"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-arm64.tar.gz"
      sha256 "97b39ee292cfe3085d2d0831f6bf9a52f74d6066228dba3e5a58d42f8cbd6abf"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_darwin-x64.tar.gz"
      sha256 "cb1174b7704a2b38b233f7fed0ab22638a92a3a69178032c105744b53e4b9c51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-arm64.tar.gz"
      sha256 "6fc358e33280db5db5a48021f0c713f2ed0d3d2a29b6cd11de0d0703517df913"
    else
      url "https://github.com/Tracer-Cloud/opensre/releases/download/v#{version}/opensre_#{version}_linux-x64.tar.gz"
      sha256 "86155e7a6a05db8ce49cd7d736ce23b39772e84b8a9ee497dc036eaf7e0c7ec0"
    end
  end

  def install
    bin.install "opensre"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/opensre --version")
  end
end
