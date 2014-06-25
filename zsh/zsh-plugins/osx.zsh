if [[ -a /Applications ]]
then
    # OS X-specific stuff
    alias tm="mate"
    alias tmm="mate ."
    alias zshrc="subl ~/.zshrc"
    # alias ohmyzsh="subl ~/.oh-my-zsh"
    alias pljson="plutil -convert json -r -o -"
    alias st="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
    alias stt="st ."
    alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
    alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

    kill-adobe-updater() {
        killall "AAM Updates Notifier" 2>/dev/null || echo "AAM Updater not running"
        rm ~/Library/LaunchAgents/com.adobe.AAM.Updater-1.0.plist 2>/dev/null || echo "LaunchAgent not found"
    }

    export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip
    
    export JAVA_HOME=/Library/Java/Home
fi
