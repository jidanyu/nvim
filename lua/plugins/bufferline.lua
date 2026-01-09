return {
  "akinsho/bufferline.nvim",
  keys = {
    {
      "<leader>1",
      function()
        require("bufferline").go_to_buffer(1, true)
      end,
      desc = "Go to buffer 1 (absolute)",
    },
    {
      "<leader>2",
      function()
        require("bufferline").go_to_buffer(2, true)
      end,
      desc = "Go to buffer 2 (absolute)",
    },
    {
      "<leader>3",
      function()
        require("bufferline").go_to_buffer(3, true)
      end,
      desc = "Go to buffer 3 (absolute)",
    },
    -- {
    --   "<leader>4",
    --   function()
    --     require("bufferline").go_to_buffer(4, true)
    --   end,
    --   desc = "Go to buffer 4 (absolute)",
    -- },
    -- {
    --   "<leader>5",
    --   function()
    --     require("bufferline").go_to_buffer(5, true)
    --   end,
    --   desc = "Go to buffer 5 (absolute)",
    -- },
    -- {
    --   "<leader>6",
    --   function()
    --     require("bufferline").go_to_buffer(6, true)
    --   end,
    --   desc = "Go to buffer 6 (absolute)",
    -- },
    -- {
    --   "<leader>7",
    --   function()
    --     require("bufferline").go_to_buffer(7, true)
    --   end,
    --   desc = "Go to buffer 7 (absolute)",
    -- },
    -- {
    --   "<leader>8",
    --   function()
    --     require("bufferline").go_to_buffer(8, true)
    --   end,
    --   desc = "Go to buffer 8 (absolute)",
    -- },
    -- {
    --   "<leader>9",
    --   function()
    --     require("bufferline").go_to_buffer(9, true)
    --   end,
    --   desc = "Go to buffer 9 (absolute)",
    -- },
    -- 可选：leader+0 跳到最后一个
    {
      "<leader>0",
      function()
        require("bufferline").go_to_buffer(-1, true)
      end,
      desc = "Go to last buffer (absolute)",
    },
  },
}
