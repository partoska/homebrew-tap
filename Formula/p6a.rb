class P6a < Formula
  desc "Command-line tool to manage and sync your event photos from Partoska"
  homepage "https://www.partoska.com/p6a"
  license "MIT"
  version "2.1.0"

  on_macos do
    url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_darwin_universal"
    sha256 "f1a3780c956010c9081e9aa1be0167b3f8698445e477d8f322e03eed1e9db94e"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_linux_amd64"
      sha256 "33d20c811c25ec48b371cefccae2e6cd7054ce66377f61f251df45d412140fde"
    end
    on_arm do
      url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_linux_arm64"
      sha256 "f91a148850cd9716777a2c93cb15e7ef6e1e4a28b5f70b6a57b4155051ef6089"
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
