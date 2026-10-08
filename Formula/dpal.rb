class Dpal < Formula
  desc "Compact user-space tool for process management"
  homepage "https://lab.partoska.com/dpal"
  license "MIT"
  version "1.3.0"

  on_macos do
    url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_darwin_universal"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_linux_amd64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_arm do
      url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_linux_arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    if OS.mac?
      bin.install "dpal_#{version}_darwin_universal" => "dpal"
    elsif Hardware::CPU.intel?
      bin.install "dpal_#{version}_linux_amd64" => "dpal"
    else
      bin.install "dpal_#{version}_linux_arm64" => "dpal"
    end
  end

  test do
    assert_match "Daemon Pal v#{version}", shell_output("#{bin}/dpal --version")
  end
end
