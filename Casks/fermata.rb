cask "fermata" do
  version "1.1.2"
  sha256 "0881652556210b5a057792134ab22c76ab666d497327e2c03171b740672ca138"

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
