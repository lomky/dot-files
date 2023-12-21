# setup brew
eval "$(/usr/local/Homebrew/bin/brew shellenv)"

# setup gpg secret key management
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
