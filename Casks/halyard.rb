cask "halyard" do
  version "0.1.0"
  sha256 "f95b610fed574701b3c412a8207bd9e7fa55b810ccdf1446701773ea6a8728c9"

  url "https://github.com/aamirsahmad/halyard/releases/download/v#{version}/Halyard-#{version}-macos-universal.zip"
  name "Halyard"
  desc "Unofficial Signal messenger client"
  homepage "https://github.com/aamirsahmad/halyard"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Halyard.app"

  # Halyard is not notarised yet. Without this, macOS blocks the first start
  # with "Apple could not verify Halyard is free of malware".
  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/Halyard.app"],
        must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/org.halyard.Halyard",
    "~/Library/Caches/org.halyard.Halyard",
    "~/Library/Preferences/org.halyard.Halyard.plist",
    "~/Library/Saved Application State/org.halyard.Halyard.savedState",
  ]

  caveats <<~EOS
    Halyard is not notarised by Apple. This cask removes the quarantine
    attribute so that macOS lets it start. Halyard is not affiliated with
    or endorsed by Signal.
  EOS
end
