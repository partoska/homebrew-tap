class P6a < Formula
  desc "Command-line tool to manage and sync your event photos from Partoska"
  homepage "https://www.partoska.com/p6a"
  license "MIT"
  version "1.10.4"

  on_macos do
    url "https://github.com/partoska/p6a-cmd/releases/download/v#{version}/p6a_#{version}_darwin_universal"
    sha256 "f8ec83d23987f8bbdd1baeb674af79df550ce939e789f233b4fea3000185bf76"
  end

  def install
    bin.install "p6a_#{version}_darwin_universal" => "p6a"
  end

  test do
    assert_match "p6a v#{version}", shell_output("#{bin}/p6a --version")
  end
end
