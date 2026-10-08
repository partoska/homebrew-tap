class Dpal < Formula
  desc "Compact user-space tool for process management"
  homepage "https://lab.partoska.com/dpal"
  license "MIT"
  version "1.3.1"

  on_macos do
    url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_darwin_universal"
    sha256 "b129a570adc5ec6499b20b35a0a8c9daeb2fdab793306ca39601cace3737b2c8"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_linux_amd64"
      sha256 "43d31caaf0c06968e93806263b757d45179961846a1e08ec169866ebdff53f61"
    end
    on_arm do
      url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_linux_arm64"
      sha256 "fd3103c9837d2b4d5b786ae7493d8ec8b80a34328798dbe5976390c1f862d844"
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
