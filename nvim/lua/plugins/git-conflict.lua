return {
  'akinsho/git-conflict.nvim',
  version = '*',
  event = 'BufReadPre',
  opts = {
    default_mappings = true, -- co (ours), ct (theirs), cb (both), c0 (none), ]x/[x (next/prev conflict)
    disable_diagnostics = true,
  },
}
