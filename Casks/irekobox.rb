cask "irekobox" do
  version "0.1.0"
  sha256 "1aa9212c83c156b848e9cfbb059aa79a87dfb0c0104be89e16069d8dd954cedb"

  url "https://github.com/sirruf/irekobox/releases/download/v#{version}/Irekobox-#{version}.dmg"
  name "Irekobox"
  desc "Native app for Apple's container, a Docker Desktop alternative"
  homepage "https://irekobox.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Irekobox.app"

  uninstall launchctl: [
              "com.irekobox.agent",
              "com.irekobox.socketlink",
            ],
            quit:      "com.irekobox.app"

  zap trash: [
    "~/.irekobox",
    "~/Library/Application Support/Irekobox",
    "~/Library/Caches/com.irekobox.app",
    "~/Library/Group Containers/YBKR9G3374.com.irekobox.shared",
    "~/Library/HTTPStorages/com.irekobox.app",
    "~/Library/HTTPStorages/com.irekobox.app.binarycookies",
    "~/Library/Preferences/com.irekobox.app.plist",
  ]
end
