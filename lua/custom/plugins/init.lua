-- init.lua acts like index.js
-- It collects all plugin specs from files in this directory
-- and returns them as a single table

local plugins = {
  'custom.plugins.ai',
  'custom.plugins.autopair',
  'custom.plugins.breadcrumbs',
  'custom.plugins.bufferline',
  'custom.plugins.flash',
  'custom.plugins.git',
  'custom.plugins.misc',
  'custom.plugins.refactoring',
  'custom.plugins.telescope',
  'custom.plugins.toggleterm',
  'custom.plugins.trouble',
  'custom.plugins.typescript-tools',
}

local P = {}

for _, mod in ipairs(plugins) do
  table.insert(P, require(mod))
end

return P
