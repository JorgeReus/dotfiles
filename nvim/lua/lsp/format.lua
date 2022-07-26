-- Auto format go files when saved
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("format_go", { clear= true }),
  pattern = "*.go",
  callback = function()
    vim.fn.jobstart({ "gofmt", "-w", vim.fn.expand('%:p') }, {
      on_exit = function(job_id, exit_code, _)
        if exit_code == 0 then
          print("Formatted " .. vim.fn.expand('%:p'))
          vim.cmd("e")
        end
      end
    })
  end
})

-- Autoformat terraform files when saved
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("format_tf", { clear= true }),
  pattern = "*.tf,*.tfvars",
  callback = function()
    vim.fn.jobstart({ "terraform", "fmt", vim.fn.expand('%:p') }, {
      on_exit = function(job_id, exit_code, _)
        if exit_code == 0 then
          print("Formatted " .. vim.fn.expand('%:p'))
          vim.cmd("e")
        end
      end
    })
  end
})

