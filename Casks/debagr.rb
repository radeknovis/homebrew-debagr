cask "debagr" do
  version "0.3.0"
  sha256 "1990a4e9203439cbae3da398613d9ad58c7f20f42c1ac896afdf93c86e6ebb7e"

  url "https://github.com/radeknovis/homebrew-debagr/releases/download/v#{version}/Debagr-#{version}.dmg"
  name "Debagr"
  desc "Remote device deployment through a private VPN"
  homepage "https://radeknovis.github.io/debagr-site/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Debagr.app"
  binary "#{appdir}/Debagr.app/Contents/MacOS/Debagr", target: "debagr"
end
