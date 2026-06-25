class P6a < Formula
  desc "Command-line tool to manage and sync your event photos from Partoska"
  homepage "https://www.partoska.com/p6a"
  license "MIT"
  version "1.11.1"

  on_macos do
    url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_darwin_universal"
    sha256 "00ec65e137180a683fbd8af4ef54db1d6af08f00923350c2cf027755df2d201f"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_linux_amd64"
      sha256 "30bd88825cf645d6c3b2384a0811090fb7cc9d681f721739deb3e9988e198de7"
    end
    on_arm do
      url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_linux_arm64"
      sha256 "d4bcfbcfd26b71662ed0520f082f5f20daced5bfee22c0e2468809ad6e3658b8"
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
