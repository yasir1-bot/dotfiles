{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withNodeJs = true;

    plugins = with pkgs.vimPlugins; [
      telescope-nvim
      plenary-nvim
      telescope-fzf-native-nvim
      nvim-tree-lua
      nvim-web-devicons
      alpha-nvim
      nvim-cmp
      cmp-path
      cmp-buffer
      cmp-nvim-lsp
      lualine-nvim
    ];

    extraPackages = with pkgs; [
      ripgrep
      fd
      fzf
      git
    ];

    extraLuaConfig = ''
      require("nvim-tree").setup()

      require("lualine").setup()

      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { ".git/" }
        }
      })

      pcall(require("telescope").load_extension, "fzf")

      local cmp = require("cmp")
      cmp.setup({
      
        sources = {
          { name = "path" },
          { name = "buffer" },
        },
      })

      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.buttons.val = {
        dashboard.button("e", "📁  File Explorer", ":NvimTreeToggle<CR>"),
        dashboard.button("f", "🔍  Find File", ":Telescope find_files<CR>"),
        dashboard.button("d", "⚙  ~/dotfiles", ":cd ~/dotfiles | Telescope find_files<CR>"),
        dashboard.button("q", "Quit", ":qa<CR>"),
      }

      alpha.setup(dashboard.config)

      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
    '';
  };
}
