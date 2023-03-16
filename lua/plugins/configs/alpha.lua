return function(_, opts)
  require("alpha").setup(opts.config)
  local excuse = require "alpha.excuse"
  opts.section.footer.val = excuse()
end
