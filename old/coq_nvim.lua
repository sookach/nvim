return {
	"ms-jpq/coq_nvim",
	branch = "coq",
	lazy = false,
	dependencies = {
		{ "ms-jpq/coq.artifacts", branch = "artifacts" },
	},
	init = function()
		vim.g.coq_settings = {
			auto_start = 'shut-up',
		}
	end,
}
