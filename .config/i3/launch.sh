#!/bin/sh
#load saved system monitor workspace and populate
#i3-msg 'workspace "S"; append_layout ~/.config/i3/monitor3.json;'
#sleep 0.25
#urxvt -e "htop" &
#sleep 1
#urxvt -e sh -c "dmesg --follow" &
#sleep 0.5
#urxvt -e sh -c "tail -f /var/log/syslog" &
#sleep 1

#read the current capslock state - result should be "on" or "off"
caps=`xset -q | grep Caps | awk '{ print $4 }'`

#if capslock is on at login, skip running these apps at startup
if [ $caps = off ]; then

        i3-msg 'workspace "1:web"'
#        urxvt &
        sleep 1
	/usr/bin/firefox &
	sleep 13
	i3-msg 'workspace "2:code"'
        sleep 0.5 
        /usr/bin/gnome-terminal &
#        sleep 10
#        fromscratch &
#        udiskie -s -f "/home/alex/bin/rangerwrapper" &
        mpd &
#        autocutsel &
        sleep 30 #wait a while to launch dropbox so everything else can finish starting since it's a resource hog
#        dropbox start &
else
        #Caps lock was enabled, so skip all the above after the monitor workspace and drop to the first workspace
        i3-msg 'workspace "1:Web"'
        #since we got here because caps lock was on at login, simulate that keypress to toggle it off.
        xdotool key Caps_Lock
fi
