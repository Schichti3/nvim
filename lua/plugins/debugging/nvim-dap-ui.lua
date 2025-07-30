return {
  'rcarriga/nvim-dap-ui',
  event = 'VeryLazy',
  dependencies = 'mfussenegger/nvim-dap',
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    dapui.setup()
    dap.listeners.after.event_initialized['dapui-config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui-config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui-config'] = function()
      dapui.close()
    end

    local os_info = vim.loop.os_uname()
    local sysname = os_info.sysname
    local codelldbPath
    print(sysname)
    if sysname == 'Linux' then
      codelldbPath = '/nix/store/azkpzqkvahhzm2dp8jyf6kw6hvpq7vi5-vscode-extension-vadimcn-vscode-lldb-1.11.4/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb'
    elseif sysname == 'Windows_NT' then
      codelldbPath = 'C:\\Users\\jan.schicht\\.vscode\\extensions\\vadimcn.vscode-lldb-1.11.5\\adapter\\codelldb.exe'
    end

    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = codelldbPath,
        args = { '--port', '${port}' },
      },
    }
    dap.configurations.cpp = {
      {
        name = 'Launch',
        type = 'codelldb', -- This refers to the adapter name defined above
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        args = {},
      },
    }
  end,
}
