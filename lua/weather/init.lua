local M = {}

M.setup = function(opts)
  opts = opts or {}
  M.default_location = opts.default_location or 'portland'
end

---Open a floating window used to display top.
---@param location? string
---@param opts? {win?:integer}
function M.show(location, opts)
  opts = opts or {}
  location = location or M.default_location

  -- Create an immutable scratch buffer that is wiped once hidden
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = buf })
  vim.api.nvim_set_option_value('modifiable', false, { buf = buf })

  -- Create a floating window using the scratch buffer positioned in the middle
  local height = math.ceil(vim.o.lines * 0.8) -- 80% of screen height
  local width = math.ceil(vim.o.columns * 0.8) -- 80% of screen width
  local win = vim.api.nvim_open_win(buf, true, {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = math.ceil((vim.o.lines - height) / 2),
    col = math.ceil((vim.o.columns - width) / 2),
    border = 'single',
  })

  -- set buffer local keymap for easy exits
  vim.keymap.set('n', 'q', ':q<CR>', { buffer = buf, silent = true })

  -- Change to the window that is floating to ensure termopen uses correct size
  vim.api.nvim_set_current_win(win)

  -- make curl request
  vim.fn.termopen { 'curl', '-s', string.format('https://wttr.in/%s', location) }
end

return M
