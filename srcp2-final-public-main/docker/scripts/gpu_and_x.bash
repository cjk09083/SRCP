# This file breaks out graphics functions from roslaunch_docker for readability

function x_host_setup() {
    if [ ! -f $XAUTH ]; then
        check_silent echo -e "$echo_info\t there is no XAUTH file \"$XAUTH\", generating..."
        touch $XAUTH
        if [ $? -ne 0 ]; then
            echo -e "$echo_error could not touch $XAUTH"
            return 1
        fi
        #
        export XAUTH=$XAUTH
        xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
    fi
    return 0
}


function nvidia_host_check() {
    has_nvidia=`lspci | grep -i nvidia | wc -l`

    if [ ${has_nvidia} -lt 1 ]; then
        echo -e "$echo_warn Could not find nvidia GPU, checking for nvidia-modprobe..."

        if ! which nvidia-modprobe > /dev/null; then
            echo -e "$echo_error nvidia-docker-plugin requires nvidia-modprobe"
            echo -e "$echo_error please install nvidia-modprobe:\n\t\tsudo apt install nvidia-modprobe"
            return 1
        fi
    fi
    return 0
}
