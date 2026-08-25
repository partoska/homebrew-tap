class P6a < Formula
  desc "Command-line tool to manage and sync your event photos from Partoska"
  homepage "https://www.partoska.com/p6a"
  license "MIT"
  version "1.11.7"

  on_macos do
    url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_darwin_universal"
    sha256 "e0bde56f6f7f727beb179ee501a911cf346d09cd1addfdf591eee31aaecbb2f4"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_linux_amd64"
      sha256 "179a809050733000a1c1eff7a6dbc2989a5cc4d9ca8b32ede54cb0672156d102"
    end
    on_arm do
      url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_linux_arm64"
      sha256 "b5e27c4c785520e1662087511b071c77ab961666c5c026e8c140fe7b4499d6f1"
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
