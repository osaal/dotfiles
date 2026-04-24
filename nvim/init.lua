require("config")
require("config.lazy")

vim.lsp.config('rust', {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', 'Cargo.lock' },
    settings = {
        ['rust-analyzer'] = {
		imports = {
			granularity = {
				group = 'module',
			},
			prefix = 'self',
		},
		procMacro =  {
			enable = true
		},
        },
    },
})
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        -- Inlay hints display inferred types, etc.
        if client:supports_method("inlayHint/resolve") then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end
        -- Completion can be invoked via ctrl+x ctrl+o. It displays a list of
        -- names inferred from the context (e.g. method names, variables, etc.)
        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, {})
        end
    end,
})
vim.lsp.enable('rust')
