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

# default developer tag is none provided
DOCKER_SUBMIT_TAG="team_omega"

# default developer tag is none provided
GPG_KEY_FILE="$BUILD_CONTEXT/srcp2_public.key"
GPG_USER="srcp2"

# The Secure Competitor Container 
# This is working container instance not on docker hub.
DOCKER_SUBMIT_CONTAINER="srcp2_submit"

# Default is ask for each step.
YESALLPROMPTS="false"


# ----------------------------------------------------------------------------------------------------------------------
# Solution Submmit Packer
#

function help(){
    echo -e "
 ${B}Synopsis:${rs}
    
    Build the the secure solution docker images this project relies upon.

 ${B}Options:${rs}

    ${B}-h | --help${rs} 
        print this message and quit
    
    ${B}-k | --key${rs}
        the public key file absolute path

    ${B}-t | --team${rs}  
        the Docker Team Name Tag in the submision docker repo if not 
        provided the defaults to team_omega a developer test image

    ${B}-y | --yes${rs} 
        yes all prompts
"
}


function docker_push_secure_solution_image() {
    echo -e "$echo_info Docker Setting:-> ${g}scheducation/srcp2_comp_solutions:${DOCKER_SUBMIT_TAG}_secure${rs} \n"
    
    [ "$YESALLPROMPTS" = "false" ] && echo -e "\n$echo_warn Do you wish to push the ${y}SUBMITTABLE CRATED IMAGE${rs} to the ${y}SRCP2 DOCKER HUB${rs} repo?\n"
    if [[ "$YESALLPROMPTS" = "true" ]] || prompt_confirm ; then

        echo -e "$echo_info ${y}YES Selected${rs}, public push to SRCP2 DOCKER HUB repo\n\n. This takes time...be patient..${y}uploads are slow..${rs}\n"
        if ! docker push scheducation/srcp2_comp_solutions:${DOCKER_SUBMIT_TAG}_secure; then
            echo -e "$echo_error SOLUTION push to the SRCP2 DOCKER HUB repo failed!!"
            return 1
        fi
        echo -e "$echo_ok \n ${g}
                ▄▖  ▌    ▘▗ ▗    ▌
                ▚ ▌▌▛▌▛▛▌▌▜▘▜▘█▌▛▌
                ▄▌▙▌▙▌▌▌▌▌▐▖▐▖▙▖▙▌ ${rs} \n\n
                public push to SRCP2 DOCKER HUB repo ${b}$SRCP2_RELEASE_REPO${rs} is now complete.\n"
    else 
        echo -e "$echo_info ${y}NO Selected${rs}, public push to SRCP2 DOCKER HUB repo ${y}skipped${rs}"
    fi

    return 0
}

function key_related_update() {
    # Removing past Public keys 
    echo -e "$echo_info Removing Past Public Keys since we alway install new keys\n"
    pk=$(gpg -k | grep -B1 "$GPG_USER" | awk -v pattern="$GPG_USER" '$0 ~ !pattern{print}' | awk '!/--/{print}' | awk '{ gsub(/ /,""); print }')
    for p in $(echo $pk | sed "s/ / /g")
    do
        [[ $(gpg --list-secret-keys | grep -w $p) ]] && gpg --batch --yes --delete-secret-key $p 
        gpg --batch --yes --delete-key $p
    done


    # 
    # Show Keys
    echo -e "$echo_info Current Keys"
    gpg --list-keys

    # 
    # Install the Public Key
    echo -e "$echo_info Installing and updateing the Public Key\n"
    gpg --batch --yes --import $GPG_KEY_FILE
    [[ $(gpg --list-keys | grep -w $GPG_USER) ]] && echo -e "$echo_info The PGP Key Setup Completed\n" 


}


# MAIN PROGRAM
echo_header


# long opts to short opts
for arg in "$@"; do
    shift
    case "$arg" in
        "--help")    set -- "$@" "-h" ;;
        "--key")     set -- "$@" "-k" ;;
        "--team")    set -- "$@" "-t" ;;
        "--yes")     set -- "$@" "-y" ;;
        *) set -- "$@" "$arg"
    esac
done

OPTIND=1
while getopts hyk:t: arg; do
  case $arg in

    h) 
        help 
        quit_with_popd 0
        ;;
    y)
        YESALLPROMPTS="true"
        echo -e "$echo_warn All Prompts are Going to Be ${y}YES${rs}\n\n"
        sleep 3
        ;;
    t)
        # default developer tag is none provided
        if [ -z ${OPTARG} ]; then
            DOCKER_SUBMIT_TAG=$DOCKER_SUBMIT_TAG
            echo -e "$echo_warn *** No Team Tag Name Set set in the -t option. Using developer test***"
        else 
            DOCKER_SUBMIT_TAG=$OPTARG
        fi
        ;;
    k)
        # default developer tag is none provided
        if [ -z ${OPTARG} ]; then
            GPG_KEY_FILE=$GPG_KEY_FILE
            echo -e "$echo_warn *** No Key File set in the -k option. ***\n"
        else
            GPG_KEY_FILE=$OPTARG
        fi
        ;;
    *) 
        echo -e "$echo_error Input option \"$arg\" not supported at this time. see '-h' for help\n"
        quit_with_popd 1
        ;;
    esac
done



echo -e "$echo_info Submit Parameters: From the Command Line Options"
echo -e "$echo_info \tTeam Tag  = ${y}$DOCKER_SUBMIT_TAG ${rs}"
if  [ ! $(docker image list | grep -w "$DOCKER_SUBMIT_TAG") ]; then
    echo -e "$echo_error The Solution For Team ${y} $DOCKER_SUBMIT_TAG ${rs} DOCKER IMAGE was not found, build the solution image before running this script"
    quit_with_popd 1
fi
echo -e "$echo_info \tKey       = ${y} $GPG_KEY_FILE ${rs}"

#*********************
# Keys 
key_related_update

#*********************
# Save Image in Tar 
[ "$YESALLPROMPTS" = "false" ] && echo -e "\n$echo_warn Do you wish to ${y}PACK THE SOLUTION FOR SUBMISSION${rs} Yes recommended?\n"
if [[ "$YESALLPROMPTS" = "true" ]] || prompt_confirm ; then
    echo -e "$echo_info \n
    ▄▖    ▌ ▘      ▄▖  ▜   ▗ ▘    
    ▙▌▀▌▛▘▙▘▌▛▌▛▌  ▚ ▛▌▐ ▌▌▜▘▌▛▌▛▌
    ▌ █▌▙▖▛▖▌▌▌▙▌  ▄▌▙▌▐▖▙▌▐▖▌▙▌▌▌
               ▄▌                

    This takes some time....    \n"
    docker save -o $BUILD_CONTEXT/$DOCKER_SUBMIT_TAG.tar $DOCKER_SUBMIT_REPO:$DOCKER_SUBMIT_TAG
fi

#*********************
# Encrypy PGP
[ "$YESALLPROMPTS" = "false" ] && echo -e "\n$echo_warn Do you wish to ${y}SECURE THE SOLUTION${rs} Yes recommended?\n"
if [[ "$YESALLPROMPTS" = "true" ]] || prompt_confirm ; then
    echo -e "$echo_info \n
    ▄   ▘▜  ▌▘      ▄▖            ▄▖         
    ▙▘▌▌▌▐ ▛▌▌▛▌▛▌  ▚ █▌▛▘▌▌▛▘█▌  ▐ ▛▛▌▀▌▛▌█▌
    ▙▘▙▌▌▐▖▙▌▌▌▌▙▌  ▄▌▙▖▙▖▙▌▌ ▙▖  ▟▖▌▌▌█▌▙▌▙▖
                ▄▌                       ▄▌  
    Encrypting takes some time....\n"
    gpg --batch --yes -e -r $GPG_USER --trust-model always $BUILD_CONTEXT/$DOCKER_SUBMIT_TAG.tar
fi

#*********************
# Start New Container.
[ "$YESALLPROMPTS" = "false" ] && echo -e "\n$echo_warn Do you wish to  ${y}BUILD SUBMITTABLE CRATED IMAGE${rs} Yes recommended?\n"
if [[ "$YESALLPROMPTS" = "true" ]] || prompt_confirm ; then
    echo -e "$echo_info Building the Secure Submit Crate Image."
    #docker rmi $(docker images | grep -w ${DOCKER_SUBMIT_TAG}_secure | tr -s ' ' | cut -d ' ' -f 3)

    [[ ! -z $(docker container ls --all | grep -w "${DOCKER_SUBMIT_CONTAINER}") ]] &&
        docker container rm -f "${DOCKER_SUBMIT_CONTAINER}"
    docker container rm -f "${DOCKER_SUBMIT_CONTAINER}"
    docker run -it --name "${DOCKER_SUBMIT_CONTAINER}" -d  alpine
    echo -e "$echo_info Copying the Secure image..it takes some time..."
    docker cp -a "${BUILD_CONTEXT}/${DOCKER_SUBMIT_TAG}.tar.gpg" "${DOCKER_SUBMIT_CONTAINER}:/opt"
    docker commit "${DOCKER_SUBMIT_CONTAINER}" "scheducation/srcp2_comp_solutions:${DOCKER_SUBMIT_TAG}_secure"
    docker kill "${DOCKER_SUBMIT_CONTAINER}"

    # Verify 
    if [[ $(docker images | grep -w ${DOCKER_SUBMIT_TAG}) ]] ; then
        echo -e "$echo_info Secure Submit Image Building is now Completed.\n"
    else    
        echo -e "$echo_error Secure Submit Image Building Failed.\n"    
    fi
    # Show Local Docker Images
    docker images | grep -w ${DOCKER_SUBMIT_TAG}
fi

#***************************
# Submit
docker_push_secure_solution_image


#***************************
#Done
quit_with_popd 0