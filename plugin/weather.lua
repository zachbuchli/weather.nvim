vim.api.nvim_create_user_command('Weather', function(opts)
  local location
  if string.len(opts.fargs) > 0 then
    location = opts.fargs[1]
  end
  require('weather').show(location)
end, {
  nargs = '*',
  desc = 'Show the weather!',
})
