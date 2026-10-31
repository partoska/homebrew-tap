class Cisivi < Formula
  desc "Query and edit CSV files from the command line"
  homepage "https://lab.partoska.com/cisivi"
  license "MIT"
  version "1.0.1"

  on_macos do
    url "https://github.com/partoska/cisivi/releases/download/v#{version}/cisivi_#{version}_darwin_universal"
    sha256 "a5c9bafc718aef0a75db91ab75446d971ca9b5cb88a4736d56340c5ec9bdb603"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/cisivi/releases/download/v#{version}/cisivi_#{version}_linux_amd64"
      sha256 "4af0be39c35a610e6d770c4c7e45272e53246896b2f1a86015ecb918e595165f"
    end
    on_arm do
      url "https://github.com/partoska/cisivi/releases/download/v#{version}/cisivi_#{version}_linux_arm64"
      sha256 "e882b0ba1ac5ae866ebb0cc9dc1f7a1370627b648908afbc09c61c55cdd17cce"
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
