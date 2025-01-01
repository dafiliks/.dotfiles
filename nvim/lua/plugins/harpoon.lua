return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
        menu = {
            width = vim.api.nvim_win_get_width(0) - 4,
        },
    },
    keys = {
        { "<leader>H", function() require("harpoon.mark"):add_file() end, desc = "Harpoon file" },
        { "<leader>h", function() require("harpoon.ui"):toggle_quick_menu() end, desc = "Harpoon quick menu" },
        { "<leader>1", function() require("harpoon.ui"):nav_file(1) end, desc = "Harpoon to file 1" },
        { "<leader>2", function() require("harpoon.ui"):nav_file(2) end, desc = "Harpoon to file 2" },
        { "<leader>3", function() require("harpoon.ui"):nav_file(3) end, desc = "Harpoon to file 3" },
        { "<leader>4", function() require("harpoon.ui"):nav_file(4) end, desc = "Harpoon to file 4" },
        { "<leader>5", function() require("harpoon.ui"):nav_file(5) end, desc = "Harpoon to file 5" },
    },
}
