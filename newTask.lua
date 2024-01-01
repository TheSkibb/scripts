-- create tasks in the style of https://github.com/obsidian-tasks-group/obsidian-tasks
-- use by adding vim.cmd("command Newtask luafile <location of file>") to your init.lua


local taskName = vim.fn.input("title: ")

local taskDue = vim.fn.input("due: ")

if taskDue == "" then
	taskDue = "" .. os.date("%Y-%m-%d")
end

taskDue =' [due:: ' .. taskDue .. ']'

local taskPriority = vim.fn.input("priority: ")

if not (taskPriority == "") then
	taskPriority = " [priority:: " .. taskPriority .. "]"
else
	taskPriority = ""
end

local taskString = taskName .. taskDue .. taskPriority .. '"'

vim.cmd('r !echo "- [ ] ' .. taskString)
