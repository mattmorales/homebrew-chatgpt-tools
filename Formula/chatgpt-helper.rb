class ChatgptHelper < Formula
  desc "ChatGPT terminal assistant that works with the ChatGPT Mac app"
  homepage "https://github.com/matthewmorales/homebrew-chatgpt-tools"
  url "https://raw.githubusercontent.com/matthewmorales/homebrew-chatgpt-tools/main/scripts/chatgpt-helper.sh"
  version "0.1.0"
  sha256 "9331c165a5b346b387b69f9af12edced2e62e8b422c8fabefce7a31bf53d2d5f"
  license "MIT"

  depends_on "charmbracelet/tap/gum"

  def install
    bin.install "chatgpt-helper.sh" => "chatgpt-helper"
  end

  test do
    assert_match "genius", shell_output("#{bin}/chatgpt-helper", 0)
  end
end
