alias start="/etc/rPImc/runtime $*"

# Only do this for main display startup
if [ -z "$DISPLAY" ] && [ $(tty) = /dev/tty1 ] ; then

   # Mount network shares to /network
    sudo fusesmb /network -o allow_other -o nonempty

   # Enable sound over HDMI
    sudo modprobe snd_bcm2835 &

   # Start PI runtime in silent mode (output to ~/PI/log instead)
   /etc/rPImc/runtime #silent
fi

