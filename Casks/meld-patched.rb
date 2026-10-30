cask "meld-patched" do
  arch arm: "arm64"

  version "3.22.3,105,1"
  sha256 "8b900ff07cebaad0e9ce00b1bc6a71271f45646a98cb5fddc678fa525c7b6c48"

  url "https://github.com/azman0101/meld-macos/releases/download/v#{version.csv.first}+#{version.csv.second}-fix#{version.csv.third}/Meld-#{version.csv.first}+#{version.csv.second}-fix#{version.csv.third}-arm64.dmg"
  name "Meld (patched for macOS)"
  desc "Visual diff and merge tool, with window placement fix"
  homepage "https://github.com/azman0101/meld-macos"

  livecheck do
    skip "Patched build of the meld cask"
  end

  conflicts_with cask: "meld"
  depends_on arch: :arm64
  depends_on :macos

  app "Meld.app"
  command_wrapper "meld",
                  executable: "#{appdir}/Meld.app/Contents/MacOS/Meld"

  # Repackaged and signed ad hoc only: without this, Gatekeeper reports the
  # app as damaged.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Meld.app"],
        writable_paths: ["Meld.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/.local/share/meld",
    "~/Library/Application Support/org.gnome.Meld",
    "~/Library/Caches/org.gnome.Meld",
    "~/Library/Preferences/org.gnome.Meld.plist",
    "~/Library/Saved Application State/org.gnome.Meld.savedState",
  ]
end
