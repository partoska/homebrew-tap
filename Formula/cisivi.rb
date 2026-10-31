class Cisivi < Formula
  desc "Query and edit CSV files from the command line"
  homepage "https://lab.partoska.com/cisivi"
  license "MIT"
  version "1.0.0"

  on_macos do
    url "https://github.com/partoska/cisivi/releases/download/v#{version}/cisivi_#{version}_darwin_universal"
    sha256 "de5afd7ced5870e35e81337ba52a77c535a6274f33174dbf7990b8ecb30a4f10"
  end

  on_linux do
    on_intel do
      url "https://github.com/partoska/cisivi/releases/download/v#{version}/cisivi_#{version}_linux_amd64"
      sha256 "bcee657aa4de9d1b8da0eddfedf1741d22f9efdb42105d2d62df3948b4652d50"
    end
    on_arm do
      url "https://github.com/partoska/cisivi/releases/download/v#{version}/cisivi_#{version}_linux_arm64"
      sha256 "e05bd1e254f3f70671d3dc3c2c595cde8642ee76e9ad7ffc6196e7f365e2984d"
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
