local dap = require("dap")

-- Example configuration for debugging languages
-- Configuration for Python debugging (requires debugpy)
dap.adapters.python = {
    type = 'executable',
    command = 'python',
    args = { '-m', 'debugpy.adapter' },
}
dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        pythonPath = function()
            return '/usr/bin/python'  -- Adjust to your python path
        end,
    },
}

-- Add additional configurations here for other languages
