# A fishy version of the fix described at
# https://github.com/microsoft/vscode/issues/60579#issuecomment-434583718 for
# the issue where invoking `code` from the command line results in multiple
# VSCode icons in the MacOS dock.
function code
  open -b com.microsoft.VSCode "$argv"
end
