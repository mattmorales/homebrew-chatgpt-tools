# 🧠 ChatGPT Terminal Tools

A custom Homebrew tap for terminal-native tools that integrate with ChatGPT.

## 🚀 Installation

```bash
brew tap matthewmorales/chatgpt-tools
brew install chatgpt-helper'
```

## ✅ Available Tools

### `chatgpt-helper`

A macOS-native terminal assistant that:

- Copies prompts or log contents to your clipboard
- Automatically opens the ChatGPT Mac app via ⌥ + Space (global shortcut)
- Uses [gum](https://github.com/charmbracelet/gum) for a beautiful terminal UI
- Stores prompt history in `~/.chatgpt-prompt-history.log`

#### 📦 Usage

```bash
chatgpt-helper
```

You’ll get a terminal UI that lets you:

- Type a custom prompt and copy it directly to your clipboard
- Summarize a file (e.g., logs, error output, or code)
- View and reuse previous prompts from your prompt history
- Automatically open the ChatGPT Mac app using your ⌥ + Space global shortcut

---

## 🧰 Coming Soon

Planned additional CLI tools in this tap:

- `gpt-log-analyzer`: Scans and summarizes log files using GPT
- `gpt-shell-debugger`: Explains bash/zsh errors and crash output
- `gpt-yaml-linter`: Validates and auto-corrects YAML files

---

## 🧠 Why This Exists

These tools are designed to:

- Supercharge your terminal workflow
- Avoid the cost of OpenAI API usage by leveraging your ChatGPT Plus plan
- Feel native to macOS and integrate with ChatGPT Desktop seamlessly
- Help DevOps, developers, and power users stay focused

---

## 🔗 Related Tools

- [ChatGPT Mac App](https://openai.com/chatgpt) — Used as the backend for this assistant
- [Gum by Charmbracelet](https://github.com/charmbracelet/gum) — Used for interactive terminal UI
- [Homebrew](https://brew.sh) — For installing and managing your CLI tools

---


## 📝 License

This project is licensed under the MIT License — see [`LICENSE`](./LICENSE) for details.
