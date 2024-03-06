return {
  {
    'CRAG666/code_runner.nvim',
    cmd = 'RunCode',
    config = function()
      require('code_runner').setup {
        mode = 'toggleterm',
        before_run_filetype = function()
          vim.cmd ':w'
        end,
        filetype = {
          cpp = {
            'cd $dir && clang++ $fileName --target=x86_64-w64-windows-gnu -o $fileNameWithoutExt && $dir/$fileNameWithoutExt',
          },
          ps1 = {
            'cd $dir && powershell -file $fileName',
          },
          go = {
            'cd $dir && go run $fileName',
          },
          rust = {
            'cd $dir && rustc $fileName && $dir/$fileNameWithoutExt',
          },
        },
      }
    end,
  },
}
