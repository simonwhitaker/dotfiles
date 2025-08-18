# A fishy version of the fix described at
# https://github.com/microsoft/vscode/issues/60579#issuecomment-434583718 for
# the issue where invoking `code` from the command line results in multiple
# VSCode icons in the MacOS dock.
function code --description "Open the files passed as arguments in Cursor if installed, else in VS Code"
    set editor_bundle_ids \
        com.todesktop.230313mzl4w4u92 \
        com.microsoft.VSCode
    for editor_bundle_id in $editor_bundle_ids
        if open -b $editor_bundle_id "$argv" 2>/dev/null
            return 0
        end
    end
    return 1
end
