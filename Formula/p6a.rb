class P6a < Formula
  desc "Command-line tool to manage and sync your event photos from Partoska"
  homepage "https://www.partoska.com/p6a"
  license "MIT"
  version "1.11.5"

  on_macos do
    url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_darwin_universal"
    sha256 "e518f86f68d4c84d3d15f7142c9ef62e95e3a1635e43ad9d35a47fb8474595ce"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_linux_amd64"
      sha256 "b9aa168d3948ce3e1b1a81589a361d9a2df15d007306510f875b1afbe2f54175"
    end
    on_arm do
      url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_linux_arm64"
      sha256 "ae8ccee3fc44258884420dac61f0ccd7779cef3c9f2b63d9ce94dc22aaf8ce8a"
    end
  end

  def install
    if OS.mac?
      bin.install "p6a_#{version}_darwin_universal" => "p6a"
    elsif Hardware::CPU.intel?
      bin.install "p6a_#{version}_linux_amd64" => "p6a"
    else
      bin.install "p6a_#{version}_linux_arm64" => "p6a"
    end
  end

  test do
    assert_match "p6a v#{version}", shell_output("#{bin}/p6a --version")
  end
end
