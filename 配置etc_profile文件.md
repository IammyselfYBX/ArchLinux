# /etc/profile

# Set our umask
umask 022

# Append our default paths
appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

appendpath '/usr/local/sbin'
appendpath '/usr/local/bin'
appendpath '/usr/bin'
unset appendpath

export PATH

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile" && . "$profile"
	done
	unset profile
fi

# Source global bash config
if test "$PS1" && test "$BASH" && test -z ${POSIXLY_CORRECT+x} && test -r /etc/bash.bashrc; then
	. /etc/bash.bashrc
fi

# Termcap is outdated, old, and crusty, kill it.
unset TERMCAP

# Man is much better than us at figuring this out
unset MANPATH

#set Java environment
JAVA_HOME=/usr/local/lib/jdk1.8.0_201/
PATH=$JAVA_HOME/bin:$PATH
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_HOME
export PATH
export CLASSPATH

# set fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

#set Qt
export QTDIR=/usr/local/src/Qtcreate4.4.1/
export PATH=$QTDIR/bin:$PATH
export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH

#系统默认文本编辑器,原来的是nano
export VISUAL=vim
export EDITOR=vim

