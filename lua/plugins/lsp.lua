return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = { preset = "enter" },          -- Enter accepts a completion
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
    },
  },
  {
    "neovim/nvim-lspconfig",   -- supplies the default server configs
    dependencies = {
        "saghen/blink.cmp",
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      -- 1. Mason itself (also puts its bin directory on your PATH)
      require("mason").setup({ ui = { border = "rounded" } })

      -- 2. Language servers: add names here to install and enable them
      require("mason-lspconfig").setup({
          ensure_installed = {
              "basedpyright",
              "ruff",
              "clangd",
              "marksman",
              "mdx_analyzer",
          },
          -- Installed servers are enabled automatically,
          -- except these two, which have their own plugins
          automatic_enable = { exclude = { "rust_analyzer", "jdtls" } },
      })

      -- 3. Non-LSP tools: formatters, and jdtls for nvim-jdtls
      require("mason-tool-installer").setup({
          ensure_installed = {
              "clang-format",
              "prettier",
              "google-java-format",
              "jdtls",
          },
      })

      -- Shared capabilites and per-server tweaks stay as before
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("basedpyright", {
        settings = { basedpyright = { analysis = { typeCheckingMode = "standard" } } },
      })
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
      })

      -- Servers are enabled by mason-lspconfig (automatic_enable above)
      -- Rust: rustaceanvim. Java: ftplugin/java.lua.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)

          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc })
          end

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>cd", vim.diagnostic.open_float, "Line diagnostics")
          map("<leader>cf", function()
            require("conform").format({ async = true, lsp_format = "fallback" })
          end, "Format buffer")

          -- Let basedpyright handle hover; ruff is just for linting/formatting
          if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end

          -- Inlay hints (parameter names, inferred types), only where supported
          if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
          end
        end,
      })
    end,
  },
}
