# Display the weather in Neovim!

![Demo screenshot](https://github.com/zachbuchli/weather.nvim/blob/main/assets/hero-shot.png)


I totally stole most of the code for this plugin from [here](https://github.com/chipsenkbeil/neovimconf-2024-talk).


## Installation


### Using lazy.nvim
```lua
{
    'zachbuchli/weather.nvim',
    opts = { default_location = 'dayton' },
    config = function()
      local weather = require 'weather'
      vim.keymap.set('n', '<leader>w', weather.show)
    end,
  },
```

You can then verify installation was successfull with `:checkhealth weather`. This plugin also
registers the command `:Weather` to display the weather.  By default, it shows the weather for
Portland, Oregon. You can pass a location string as the first argument.  Such as `:Weather dayton`
for weather in Dayton, Ohio.
