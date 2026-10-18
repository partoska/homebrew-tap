class Dpal < Formula
  desc "Compact user-space tool for process management"
  homepage "https://lab.partoska.com/dpal"
  license "MIT"
  version "1.4.0"

  on_macos do
    url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_darwin_universal"
    sha256 "3ab766d95f220128aae8ace38ca22dc890a99472b6a53165e9ad747a8d24e1b3"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_linux_amd64"
      sha256 "859aa6a78f36b64debbc9f0bdeb5923e5f49ade05ac07dd46c5ad38a9925532e"
    end
    on_arm do
      url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_linux_arm64"
      sha256 "94a24fc96aafaa10776c8511a7b10303720c7694a6b67e47fe2c76b59dcb19ec"
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
