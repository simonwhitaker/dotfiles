# Defined in /usr/local/Cellar/fish/3.2.0/share/fish/functions/__fish_print_pipestatus.fish @ line 1
#
# This override can be removed once I'm on fish 3.2.1, see https://github.com/fish-shell/fish-shell/issues/7771
#
function __fish_print_pipestatus --description 'Print pipestatus for prompt'
    set -l last_status
    if set -q __fish_last_status
        set last_status $__fish_last_status
    else
        set last_status $argv[-1] # default to $pipestatus[-1]
    end

    set -l left_brace $argv[1]
    set -l right_brace $argv[2]
    set -l separator $argv[3]
    set -l brace_sep_color $argv[4]
    set -l status_color $argv[5]

    set -e argv[1 2 3 4 5]

    if not set -q argv[1]
        echo error: missing argument >&2
        status print-stacktrace >&2
        return 1
    end

    # Only print status codes if the job failed.
    # SIGPIPE (141 = 128 + 13) is usually not a failure, see #6375.
    if not contains $last_status 0 141
        set -l sep (set_color normal)$brace_sep_color$separator$status_color
        set -l last_pipestatus_string (fish_status_to_signal $argv | string join "$sep")
        set -l last_status_string ""
        if test "$last_status" -ne "$argv[-1]"
            set last_status_string " "$status_color$last_status
        end
        printf "%s" $brace_sep_color $left_brace \
            (set_color normal) $status_color $last_pipestatus_string \
            (set_color normal) $brace_sep_color $right_brace $last_status_string (set_color normal)
    end
end
