cask "halyard" do
  version "0.2.0"
  sha256 "4ab09f8c9df2340d355d04ca134a8b050457e7782c9d19851351a740d3bc8217"

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
