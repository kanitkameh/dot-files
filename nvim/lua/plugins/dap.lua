return {

  {
    "mfussenegger/nvim-dap",
    config = function()
        require("dap").configurations.scala = {
            {
                type = "scala",
                request = "launch",
                name = "RunOrTest",
                metals = {
                    runType = "runOrTestFile",
                    --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
                },
            },
            {
                type = "scala",
                request = "launch",
                name = "Test Target",
                metals = {
                    runType = "testTarget",
                },
            },
        }
    end,
    keys = {
        {"<leader>dc", ":lua require(\"dap\").continue()<cr>"},
        {"<leader>dr", ":lua require(\"dap\").repl.toggle()<cr>"},
        {"<leader>dK", ":lua require(\"dap.ui.widgets\").hover()<cr>"},
        {"<leader>db", ":lua require(\"dap\").toggle_breakpoint()<cr>"},
        {"<leader>dso", ":lua require(\"dap\").step_over()<cr>"},
        {"<leader>dsi", ":lua require(\"dap\").step_into()<cr>"},
        {"<leader>dl", ":lua require(\"dap\").run_last()<cr>"}
    }
  },

}
