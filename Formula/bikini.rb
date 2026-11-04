class Bikini < Formula
  desc "Query and edit INI files from the command line"
  homepage "https://lab.partoska.com/bikini"
  license "MIT"
  version "2.0.2"

  on_macos do
    url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_darwin_universal"
    sha256 "67ae61516edbc0b6aed7e62190206e4180a3d8dd93508be9b5d63ec19d7af8e0"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_linux_amd64"
      sha256 "df243ce36a7869350277c34fd7f3e872e02a32ec121a12c70e1b8982edea21bd"
    end
    on_arm do
      url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_linux_arm64"
      sha256 "6db9ac91dd9815a326adef0c63840eb1a0d3e05ccd5311b6f654f6301517396a"
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
