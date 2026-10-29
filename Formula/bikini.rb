class Bikini < Formula
  desc "Query and edit INI files from the command line, in the spirit of jq"
  homepage "https://lab.partoska.com/bikini"
  license "MIT"
  version "1.0.0"

  on_macos do
    url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_darwin_universal"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_linux_amd64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_arm do
      url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_linux_arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
