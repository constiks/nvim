local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "NONE" })
-- vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "NONE" })
