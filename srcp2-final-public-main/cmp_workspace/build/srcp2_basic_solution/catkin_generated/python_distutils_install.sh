#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/srcp2/cmp_workspace/src/srcp2_basic_solution"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/srcp2/cmp_workspace/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/srcp2/cmp_workspace/install/lib/python3/dist-packages:/home/srcp2/cmp_workspace/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/srcp2/cmp_workspace/build" \
    "/usr/bin/python3" \
    "/home/srcp2/cmp_workspace/src/srcp2_basic_solution/setup.py" \
    egg_info --egg-base /home/srcp2/cmp_workspace/build/srcp2_basic_solution \
    build --build-base "/home/srcp2/cmp_workspace/build/srcp2_basic_solution" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/srcp2/cmp_workspace/install" --install-scripts="/home/srcp2/cmp_workspace/install/bin"
