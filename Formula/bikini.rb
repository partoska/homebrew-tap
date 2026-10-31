class Bikini < Formula
  desc "Query and edit INI files from the command line"
  homepage "https://lab.partoska.com/bikini"
  license "MIT"
  version "2.0.0"

  on_macos do
    url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_darwin_universal"
    sha256 "b3b07b44dbb42eba0e84d251980a7cb45258c3ad65f9717674899514a2e5894f"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_linux_amd64"
      sha256 "7f6c07d88ed4ba9e3f6a99ec2892a574bc1e639376588a173d9df4ff24ad2d93"
    end
    on_arm do
      url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_linux_arm64"
      sha256 "b3392dcfbf6857f04ddee11b24c3f3add996f7b2a3a004b0304853ce306a5946"
    end
  end

  def install
    if OS.mac?
      bin.install "bikini_#{version}_darwin_universal" => "bikini"
    elsif Hardware::CPU.intel?
      bin.install "bikini_#{version}_linux_amd64" => "bikini"
    else
      bin.install "bikini_#{version}_linux_arm64" => "bikini"
    end
  end

  test do
    assert_match "bikini #{version}", shell_output("#{bin}/bikini --version")
    (testpath/"app.ini").write <<~INI
      [server]
      port = 8080
    INI
    assert_equal "8080\n", shell_output("#{bin}/bikini server.port #{testpath}/app.ini")
    shell_output("#{bin}/bikini server.host #{testpath}/app.ini", 1)
  end
end
