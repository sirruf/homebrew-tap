cask "irekobox" do
  version "0.1.6"
  sha256 "91542b38161ddd81916aef844d925f7815bb93d87516b3fa659c383480e55d34"

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
