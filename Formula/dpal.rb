class Dpal < Formula
  desc "Compact user-space tool for process management"
  homepage "https://lab.partoska.com/dpal"
  license "MIT"
  version "1.4.1"

  on_macos do
    url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_darwin_universal"
    sha256 "1cb19c935f35b8354b639c8bffbaed3fe117258e96324400a6e1d0045f39af17"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_linux_amd64"
      sha256 "eb12be3c60d182cf200a5b468e2e224f17d44c691fbd3f3c4e351ae781ca5840"
    end
    on_arm do
      url "https://github.com/partoska/dpal/releases/download/v#{version}/dpal_#{version}_linux_arm64"
      sha256 "28ff0257deebee30db3cac1a2df0436019a673b9f4366c6e7b8b4bc878029aa6"
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
