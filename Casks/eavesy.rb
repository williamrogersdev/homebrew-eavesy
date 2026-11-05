cask "eavesy" do
  version "0.9.8"
  sha256 "041b7ddc45534e52393908279e59d952a2626c906f102e97398de1140c177ae3"

  url "https://eavesy.com/api/downloads/mac/Eavesy_#{version}_aarch64.dmg"
  name "Eavesy"
  desc "Local-first capture tool that turns drops into Markdown context for AI agents"
  homepage "https://eavesy.com/"

  livecheck do
    url "https://eavesy.com/api/updates/darwin/aarch64/0.0.0"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Eavesy.app"

  # The device token lives in the login Keychain under the services
  # "com.eavesy.desktop.device-token.v2" (and the legacy
  # "com.eavesy.desktop.device-token"). Casks cannot remove Keychain items;
  # delete them in Keychain Access or with `security delete-generic-password -s <service>`.
  # Recordings mirrored to ~/Eavesy are user data and are intentionally kept.
  zap trash: [
    "~/Library/Application Support/com.eavesy.desktop",
    "~/Library/Caches/com.eavesy.desktop",
    "~/Library/HTTPStorages/com.eavesy.desktop",
    "~/Library/Logs/com.eavesy.desktop",
    "~/Library/Preferences/com.eavesy.desktop.plist",
    "~/Library/Saved Application State/com.eavesy.desktop.savedState",
    "~/Library/WebKit/com.eavesy.desktop",
  ]
end
