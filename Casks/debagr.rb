cask "debagr" do
  version "0.2.0"
  sha256 "eb9e32843309f05040f55c9fac61ba348591ff48924936efccfea1524402f9e0"

  url "https://github.com/radeknovis/homebrew-debagr/releases/download/v#{version}/Debagr-#{version}.dmg"
  name "Debagr"
  desc "Remote device deployment through a private VPN"
  homepage "https://radeknovis.github.io/debagr-site/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Debagr.app"
  binary "#{appdir}/Debagr.app/Contents/MacOS/Debagr", target: "debagr"
end
