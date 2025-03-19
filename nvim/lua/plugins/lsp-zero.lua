return {
	'VonHeikemen/lsp-zero.nvim',
	dependencies = {
		-- lsp
		'neovim/nvim-lspconfig',

		-- autocmp
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',

		-- snippets
		'L3MON4D3/LuaSnip',
		'rafamadriz/friendly-snippets',
	},
	config = function()
		local lsp = require("lsp-zero")
		local cmp = require('cmp')
		local cmp_action = require('lsp-zero').cmp_action()
		cmp.setup({
			mapping = {
				['<C-p>'] = cmp.mapping.select_prev_item(),
				['<C-n>'] = cmp.mapping.select_next_item(),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-space>'] = cmp.mapping.complete(),
				['<Tab>'] = cmp_action.luasnip_supertab(),
				['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
				['<CR>'] = cmp.mapping.confirm({ select = false }),
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
				{ name = 'path' },
				{ name = 'luasnip' },
			},
		})

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
			vim.keymap.set("n", "vws", function() vim.lsp.buf.workspace_symbol() end, opts)
			vim.keymap.set("n", "vd", function() vim.diagnostic.open_float() end, opts)
			vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
			vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
			vim.keymap.set("n", "vca", function() vim.lsp.buf.code_action() end, opts)
			vim.keymap.set("n", "vrr", function() vim.lsp.buf.references() end, opts)
			vim.keymap.set("n", "vrn", function() vim.lsp.buf.rename() end, opts)
			vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
		end)

		-- Set LSP preferences directly
		lsp.set_sign_icons({
			error = "✗",
			warn = "⚠",
			hint = "➤",
			info = "ℹ"
		})

		-- Setup LSP servers
		lsp.setup()

		-- Configure specific language server settings
		require('lspconfig').pyright.setup({
			on_attach = lsp.on_attach
		})

		require('lspconfig').lua_ls.setup({
			on_attach = lsp.on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
				},
			},
		})

		require('lspconfig').clangd.setup({
			on_attach = lsp.on_attach
		})

		require('lspconfig').rust_analyzer.setup({
			on_attach = lsp.on_attach,
			settings = {
				['rust-analyzer'] = {
					assist = {
						importMergeBehavior = "last",
						importPrefix = "by_crate",
					},
					cargo = {
						loadOutDirsFromCheck = true,
					},
					procMacro = {
						enable = true,
					},
				},
			},
		})

		require('lspconfig').jdtls.setup({
			cmd = { 'jdtls' }, -- Make sure jdtls is available in your PATH
			root_dir = function(fname)
				return require('lspconfig').util.root_pattern('build.gradle', 'pom.xml', '.git')(fname) or vim.fn.getcwd()
			end,
			on_attach = lsp.on_attach,
			settings = {
				java = {
					format = {
						enabled = true,
					},
				},
			},
		})
	end
}
