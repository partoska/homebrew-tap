class Bikini < Formula
  desc "Query and edit INI files from the command line"
  homepage "https://lab.partoska.com/bikini"
  license "MIT"
  version "1.0.0"

  on_macos do
    url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_darwin_universal"
    sha256 "db215c4c233536f5f0b6f96cf5a32a3f5c06e0c07c85ea1a5963912ad20395ac"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_linux_amd64"
      sha256 "50c8e503c234fb96cd966c3c77be61d168a8fccd921eda75ec20e810ede2af3e"
    end
    on_arm do
      url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_linux_arm64"
      sha256 "6dd40c50a72f42f0f7f307db5630613a931fc62b2c1e90d832bed1421e278414"
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
