cask "fermata" do
  version "1.1.1"
  sha256 "81b7075633fc5114d24c4dd916ffdc4ef9e46a382a9f07dd7ffb271f32e3488e"

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
