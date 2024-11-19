return {
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_filetypes = {
                gitcommit = true,
            }
        end
    },

    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            "github/copilot.vim", -- or zbirenbaum/copilot.lua
            "nvim-lua/plenary.nvim", -- for curl, log wrapper
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {},
        keys = {
            {"<leader>ct", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat"},
        },
    },
}
