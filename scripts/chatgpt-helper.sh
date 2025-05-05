#!/bin/bash

# ChatGPT Terminal Assistant with gum + osascript
# Uses your ChatGPT Plus plan via the Mac app (no API costs)
# Compatible with macOS: uses tail -r instead of tac

HISTORY_FILE="$HOME/.chatgpt-prompt-history.log"

# Ensure gum is installed
if ! command -v gum &> /dev/null; then
  echo "❌ 'gum' is not installed. Run: brew install charmbracelet/tap/gum"
  exit 1
fi

# Simulate Option + Space to trigger ChatGPT Mac app
function trigger_chatgpt_hotkey() {
  osascript <<EOF
  tell application "System Events"
    key down option
    keystroke space
    key up option
  end tell
EOF
}

# Ask a custom prompt
function ask_custom_prompt() {
  local prompt
  prompt=$(gum input --placeholder "What do you want to ask ChatGPT?" --width 80)

  if [ -n "$prompt" ]; then
    echo "$prompt" | pbcopy
    echo "$prompt" >> "$HISTORY_FILE"
    trigger_chatgpt_hotkey
    gum style --border double --padding "1 2" --foreground 212 "📋 Prompt copied & ChatGPT opened!"
  fi
}

# Summarize a file
function summarize_file_prompt() {
  local file_path
  file_path=$(gum file --file)

  if [ -f "$file_path" ]; then
    local content
    content=$(<"$file_path")
    local summary="Please summarize and debug this file:\n\n$content"
    echo -e "$summary" | pbcopy
    echo "Summarize $file_path" >> "$HISTORY_FILE"
    trigger_chatgpt_hotkey
    gum style --border double --padding "1 2" --foreground 212 "📄 File content copied!"
  else
    gum style --border normal --padding "1 2" --foreground 1 "❌ File not found."
  fi
}

# View and reuse history
function show_prompt_history() {
  if [ ! -f "$HISTORY_FILE" ]; then
    gum style --foreground 1 "No history found yet."
    return
  fi

  local selected
  selected=$(tail -r "$HISTORY_FILE" | gum choose --height 20)

  if [ -n "$selected" ]; then
    echo "$selected" | pbcopy
    trigger_chatgpt_hotkey
    gum style --border double --padding "1 2" --foreground 212 "📜 Prompt from history copied!"
  fi
}

# Main menu
function main_menu() {
  while true; do
    local choice
    choice=$(gum choose --height 10 \
      "📝 Ask a custom prompt" \
      "📄 Summarize/debug a file" \
      "📜 View prompt history" \
      "❌ Exit")

    case "$choice" in
      "📝 Ask a custom prompt") ask_custom_prompt ;;
      "📄 Summarize/debug a file") summarize_file_prompt ;;
      "📜 View prompt history") show_prompt_history ;;
      "❌ Exit") echo "👋 Later, genius." ; exit 0 ;;
    esac
    echo
  done
}

main_menu
