class Dpal < Formula
  desc "Compact user-space tool for process management"
  homepage "https://lab.partoska.com/dpal"
  license "MIT"
  version "1.3.2"

  on_macos do
    url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_darwin_universal"
    sha256 "05f333ae2187ef5a944c47097b8a5a2236e1c055046fa1a8f88ed720b13defe9"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_linux_amd64"
      sha256 "44e9cca733215851a54d728d6da04b95a46ce3f2d81d709bd51776f015079730"
    end
    on_arm do
      url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_linux_arm64"
      sha256 "e5f4f1a7fe06d8118fa84db6742d0738adf4e5acdb7a21670483130ecbad164a"
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
