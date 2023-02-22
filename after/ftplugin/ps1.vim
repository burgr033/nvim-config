if exists(':AsyncRun')
  nnoremap <buffer><silent> <C-F9> :<C-U>AsyncRun pwsh -file "$(VIM_FILEPATH)"<CR>
  nnoremap <buffer><silent> <C-F10> :call asyncrun#quickfix_toggle(8)<cr>
  nnoremap <buffer><silent> <C-F11> :<C-U>AsyncRun -save=1 -post=checktime pwsh -command (Set-AuthenticodeSignature -FilePath "$(VIM_FILEPATH)" -Certificate $(Get-Childitem -Path Cert:\CurrentUser\My -CodeSigningCert))<CR>
endif
