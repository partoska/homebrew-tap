class Bikini < Formula
  desc "Query and edit INI files from the command line"
  homepage "https://lab.partoska.com/bikini"
  license "MIT"
  version "2.0.1"

  on_macos do
    url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_darwin_universal"
    sha256 "8de958caf87d11ce26d5069e77a9be45e8ba2273c675dd8324260e0acfd46d65"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_linux_amd64"
      sha256 "7c31d783eae81ea0acc1733bfe97fa33b58f463797c57fbd231b1cc54f8c952a"
    end
    on_arm do
      url "https://github.com/partoska/bikini/releases/download/v#{version}/bikini_#{version}_linux_arm64"
      sha256 "6801e28f1934f4d6b97c6f450bcc788599b9f2b6bfed1e4a542b3936dc6cef28"
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
