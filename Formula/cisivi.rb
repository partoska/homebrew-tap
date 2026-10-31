class Cisivi < Formula
  desc "Query and edit CSV files from the command line"
  homepage "https://lab.partoska.com/cisivi"
  license "MIT"
  version "1.0.0"

  on_macos do
    url "https://github.com/partoska/cisivi/releases/download/v#{version}/cisivi_#{version}_darwin_universal"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/cisivi/releases/download/v#{version}/cisivi_#{version}_linux_amd64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_arm do
      url "https://github.com/partoska/cisivi/releases/download/v#{version}/cisivi_#{version}_linux_arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    if OS.mac?
      bin.install "cisivi_#{version}_darwin_universal" => "cisivi"
    elsif Hardware::CPU.intel?
      bin.install "cisivi_#{version}_linux_amd64" => "cisivi"
    else
      bin.install "cisivi_#{version}_linux_arm64" => "cisivi"
    end
  end

  test do
    assert_match "cisivi #{version}", shell_output("#{bin}/cisivi --version")
    (testpath/"crew.csv").write <<~CSV
      name,age
      Kirk,34
    CSV
    assert_equal "Kirk\n", shell_output("#{bin}/cisivi name #{testpath}/crew.csv")
    shell_output("#{bin}/cisivi species #{testpath}/crew.csv", 1)
  end
end
