vim.api.nvim_create_user_command('Weather', function(opts)
  local location
  if string.len(opts.args) > 0 then
    location = opts.args
  end
  require('weather').show(location)
end, {
  nargs = '*',
  desc = 'Show the weather!',
})
