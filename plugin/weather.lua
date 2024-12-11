vim.api.nvim_create_user_command('Weather', function(opts)
  local location = opts.fargs[1]
  require('weather').show(location)
end, {
  nargs = '?',
  desc = ':Weather <location?>  Show the weather from https://wttr.in',
})
