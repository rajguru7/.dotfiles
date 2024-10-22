return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
    default = {
        dir_path = "docs/res/img", ---@type string
        extension = "png", ---@type string
        file_name = "%Y-%m-%d-%H-%M-%S", ---@type string
        use_absolute_path = false, ---@type boolean
        relative_to_current_file = false, ---@type boolean

        -- prompt options
        prompt_for_file_name = true, ---@type boolean
        show_dir_path_in_prompt = true,
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
