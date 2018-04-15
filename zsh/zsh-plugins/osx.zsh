if [[ -a /Applications ]]
then
    # OS X-specific stuff
    alias pljson="plutil -convert json -r -o -"
    alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
    alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

    function man-preview() {
        man -t "$@" | open -f -a Preview
    }
fi
