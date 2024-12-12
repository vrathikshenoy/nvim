
# Neovim Configuration with LazyVim

This repository contains my custom Neovim configuration, built on top of the [LazyVim](https://github.com/LazyVim/LazyVim) framework. It provides a clean, fast, and highly extensible development environment optimized for modern workflows.

## Features

- **Lazy Loading**: Efficient plugin loading using [lazy.nvim](https://github.com/folke/lazy.nvim).
- **Preconfigured Plugins**: Includes popular plugins for LSP, Treesitter, Telescope, and more.
- **Custom Keymaps**: Streamlined and intuitive key bindings.
- **Theming**: Beautiful and configurable color schemes.

## Installation

### Prerequisites

- Neovim 0.10+ ([installation guide](https://github.com/neovim/neovim/wiki/Installing-Neovim))
- Git

### Steps

1. Clone this repository:
   ```bash
   git clone https://github.com/vrathikshenoy/nvim ~.config/nvim
   ```

2. Open Neovim and LazyVim will automatically install the required plugins:
   ```bash
   nvim
   ```

3. Restart Neovim after installation completes.

## Key Bindings

Here are some custom key bindings included in this configuration:

| Keybinding       | Action                           |
|------------------|----------------------------------|
| `<leader>ff`     | Find files using Telescope       |
| `<leader>fs`     | Save current file               |
| `<leader>q`      | Close the current buffer        |
| `<leader>t`      | Toggle file tree (NvimTree)     |
| `<leader>p`      | Open plugin manager (Lazy.nvim) |

For a full list of key bindings, refer to the `keymaps.lua` file.

## References

- [LazyVim GitHub Repository](https://github.com/LazyVim/LazyVim)
- [lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)
- [Neovim Documentation](https://neovim.io/doc/)

## Contributing

Feel free to open issues or submit pull requests if you have suggestions or improvements!

## License

This configuration is open source and available under the [MIT License](LICENSE).

---

Thank you for checking out my Neovim configuration! Happy coding!
