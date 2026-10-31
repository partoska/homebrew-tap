class P6a < Formula
  desc "Command-line tool to manage and sync your event photos from Partoska"
  homepage "https://www.partoska.com/p6a"
  license "MIT"
  version "1.14.0"

  on_macos do
    url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_darwin_universal"
    sha256 "b33631f5ca0dba28271458ac72c4b1140e9e7dd4b64ceb9676e32d8cefcb1aa7"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_linux_amd64"
      sha256 "dcc9329dabac1c8e20d1738c075fec37927f0e6cc9f2c3bc624d1307a893caec"
    end
    on_arm do
      url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_linux_arm64"
      sha256 "b9fa234fd376eda6a58a23bb29b154df697bc90d72895836fcb5107e9304b317"
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
