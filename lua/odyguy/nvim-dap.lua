local dap = require("dap")

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = vim.fn.exepath("OpenDebugAD7"),
}

dap.adapters.dart = {
	type = "executable",
	command = vim.fn.exepath("dart-debug-adapter"),
	args = { "flutter" },
}

dap.adapters.jsdebug = {
	type = "executable",
	command = vim.fn.exepath("js-debug-adapter"),
}

dap.adapters.debugpy = {
	type = "executable",
	command = vim.fn.exepath("debugpy-adapter"),
}

dap.adapters.chrome = {
	type = "executable",
	command = vim.fn.exepath("chrome-debug-adapter"),
}

dap.adapters.coreclr = {
	type = "executable",
	command = vim.fn.exepath("netcoredbg"),
	args = { "--interpreter=vscode" },
}

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.exepath("codelldb"),
		args = { "--port", "${port}" },
	},
}

dap.adapters.delve = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.exepath("dlv"),
		args = { "dap", "-l", "127.0.0.1:${port}" },
	},
}

-- windows specific options
if vim.fn.has("win32") == 1 then
	dap.adapters.cppdbg.options = {
		detached = false,
	}
	dap.adapters.codelldb.executable.detached = false
end

-- configurations for c debugging
dap.configurations.c = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "Enable pretty-printing for gdb",
				ignoreFailures = true,
			},
		},
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "Enable pretty-printing for gdb",
				ignoreFailures = true,
			},
		},
	},
}

-- use the same configuration for rust and c++
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
