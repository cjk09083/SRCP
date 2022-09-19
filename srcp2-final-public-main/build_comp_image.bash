#! /usr/bin/env bash
#
# Space Robotics Competition 2: NASA JSC
# Copyright (c), 2019-2021 NASA-JSC. All Rights Reserved
# Unauthorized distribution strictly prohibited
#
#
pushd `pwd` > /dev/null 2>&1
cd $(cd -P -- "$(dirname -- "$0")" && pwd -P)
source "srcp2_setup.bash"

# ----------------------------------------------------------------------------------------------------------------------
# CONSTANTS AND NAMES
#
BUILD_CONTEXT=$( cd "../../"; pwd) # the repo root
DOCKER_BUILD_ARGS=""
#
BUILD_LOG="/tmp/docker-build-log.txt"
OUTPUT_LOG=" > $BUILD_LOG 2>&1"
VERBOSE=0
# Solution 
DOCKER_SUBMIT_REPO="scheducation/srcp2_comp_solutions"
DOCKER_SUBMIT_TAG="team_omega"

# Base Line
DOCKER_BASE_REPO="scheducation/srcp2_comp"
DOCKER_BASE_TAG="final_competitor"
#


# ----------------------------------------------------------------------------------------------------------------------
# UTILITY FUNCTIONS
#

function help(){
    echo -e "
 ${B}Synopsis:${rs}
    
    Build the the solution docker images this project relies upon.
    By default, this will build everything, you can specify 
    which image sets you build

 ${B}Options:${rs}

    ${B}-h | --help${rs} 
        print this message and quit
    
    ${B}-n | --new${rs}
        build any clean (--no-cache). This forces total rebuild and 
        will be slow!

    ${B}-t | --team${rs}  
        the Team Name Tag in the submision docker hub repo if not 
        provided the defaults to team_omega a developer test image

    ${B}-v | --verbose${rs} 
        build verbose, show all docker outputs to stdout
"
}

function test_build_ok() {
    if [ $1 -ne 0 ]; then
        echo -e "$echo_error could not build image for ${r}$2${rs}"
        echo
        if [ $VERBOSE -eq 0 ]; then
            cat $3
        fi
        return $1
    else
        echo -e "$echo_ok completed build ${b}$2${rs}"
        return 0
    fi
}

# ----------------------------------------------------------------------------------------------------------------------
#
function build_solution_images() {

    dockerfiles="$(cd ../dockerfiles; pwd)"


    tag="${DOCKER_SUBMIT_REPO}:${DOCKER_SUBMIT_TAG}"
    echo -e "$echo_info building ${b}$tag${rs}"
    docker build ${DOCKER_BUILD_ARGS} \
        --file ${dockerfiles}/solution.dockerfile \
        --tag  $tag \
        --build-arg base_image=${DOCKER_BASE_REPO}:${DOCKER_BASE_TAG} \
        \
        $BUILD_CONTEXT
    
    if ! test_build_ok $? $tag $BUILD_LOG; then return 1; fi
    echo

    return 0
}


# ----------------------------------------------------------------------------------------------------------------------
# MAIN PROGRAM

echo_header

# long opts to short opts
for arg in "$@"; do
    shift
    case "$arg" in
        "--help")    set -- "$@" "-h" ;;
        "--team")    set -- "$@" "-t" ;;
        "--new")     set -- "$@" "-n" ;;
        "--verbose") set -- "$@" "-v" ;;
        *) set -- "$@" "$arg"
    esac
done

OPTIND=1
while getopts hnvt: arg; do
  case $arg in

    h) 
        help 
        quit_with_popd 0
        ;;
    n) 
        DOCKER_BUILD_ARGS="--no-cache"
        echo -e "$echo_info Forcing from-scratch rebuild. This will be slow!"
        ;;
    v)
        VERBOSE=1
        echo -e "$echo_info Building in verbose mode"
        ;;

    t)
        if [ -z ${OPTARG} ]; then
            DOCKER_SUBMIT_TAG=$DOCKER_SUBMIT_TAG
        else 
            DOCKER_SUBMIT_TAG=$OPTARG
        fi
        ;;
    *) 
        echo -e "$echo_error Input option \"$arg\" not supported at this time. see '-h' for help"
        quit_with_popd 1
        ;;
    esac
done

echo -e "$echo_info Build Parameters:"
echo -e "$echo_info \tDocker build context = $(cd $BUILD_CONTEXT; pwd)"
echo -e "$echo_info \tBuild Log            = $BUILD_LOG"
echo

if ! build_solution_images; then
    quit_with_popd $?;
fi
echo -e "$echo_info Solution Image Detail : ${b}${DOCKER_SUBMIT_REPO}:${DOCKER_SUBMIT_TAG}${rs}"
echo -e "\n$echo_ok Solution Image Built."

quit_with_popd 0