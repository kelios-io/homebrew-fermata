cask "fermata" do
  version "0.3.0"
  sha256 "04a9d26851789ce649b5503ac99205af54176c25d90c0f950d951acc983544d0"

  url "https://releases.fermata.run/Fermata-#{version}.dmg"
  name "Fermata"
  desc "Native macOS AI agent orchestrator for Claude Code"
  homepage "https://fermata.run"

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "Fermata.app"

  zap trash: [
    "~/Library/Application Support/Fermata",
    "~/Library/Preferences/app.fermata.plist",
    "~/Library/Caches/app.fermata",
    "~/Library/HTTPStorages/app.fermata",
    "~/Library/Saved Application State/app.fermata.savedState",
    "~/Library/WebKit/app.fermata",
  ]

  caveats <<~EOS
    Fermata requires macOS 26 Tahoe or later.

    Fermata updates itself via Sparkle; `brew upgrade --cask fermata` is only
    needed when the Sparkle appcast is unavailable or for major version bumps.

    API keys stored in the macOS Keychain are not removed by `brew uninstall
    --zap`; remove them manually from Keychain Access if desired.
  EOS
end
