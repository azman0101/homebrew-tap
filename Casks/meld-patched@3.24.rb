cask "meld-patched@3.24" do
  arch arm: "arm64"

  version "3.24.1,2"
  sha256 "8d13053f028df6767b802b3f3e4de5e342e17c4c3c5977170e23e81eb5737cd2"

  url "https://github.com/azman0101/meld-macos/releases/download/v#{version.csv.first}-fix#{version.csv.second}/Meld-#{version.csv.first}-fix#{version.csv.second}-arm64.dmg"
  name "Meld 3.24 (patched for macOS)"
  desc "Visual diff and merge tool, with window placement fix"
  homepage "https://github.com/azman0101/meld-macos"

  livecheck do
    skip "Patched build of the meld cask"
  end

  conflicts_with cask: ["meld", "meld-patched"]
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
