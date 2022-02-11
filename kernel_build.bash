#! /bin/bash
#
# Set up some general functions

source ${HOME}/scripts/bash_functions.bash

kernel_clean() {
    cd $KERNEL_DIR

    print_info " +++ Started clean-up +++"
    fakeroot make-kpkg clean
    print_info " --- Finished clean-up ---"

    cd ..

}

kernel_build() {
    cd $KERNEL_DIR

    print_info " +++ Starting compilation +++"
    revision_str="`date '+%Y-%m-%d-%H%M'`"
    fakeroot make-kpkg --jobs=4 --initrd --append-to-version=-mat1 --revision="$revision_str" \
	kernel_image kernel_headers modules_image
    print_info " --- Finished compilation ---"

    cd ..

}

kernel_install() {
    promptYESNO " Install kernel" "y"
    if [ "$YESNO" = "y" ] ; then
	sudo dpkg -i linux-image-${KERNEL_VER}-mat1_${revision_str}_amd64.deb 
	sudo dpkg -i linux-headers-${KERNEL_VER}-mat1_${revision_str}_amd64.deb
    fi
}


# Check for a version
if [ $# -lt 1 ] ; then
  print_error "Linux version to build not specified."
  exit 1
fi

KERNEL_VER="$1"
KERNEL_DIR="./linux-$KERNEL_VER"

if [ ! -d "$KERNEL_DIR" ] ; then
    print_error "Directory for kernel cannot be found ($KERNEL_DIR) "
    exit 1
fi

# Check to see if we want to install only
if [ $# -eq 2 ] ; then
  BUILD_COMMAND="$2"
else
  BUILD_COMMAND="make all"
fi

print_info "+++ Starting build of kernel $KERNEL_VER: command is [${BUILD_COMMAND}]"

case "${BUILD_COMMAND}" in
    "clean")
	kernel_clean ;;
    "build")
	kernel_build ;;
    "install")
	kernel_install ;;
    "make all")
	kernel_clean ; kernel_build ; kernel_install ;;
    "*")
	print_error "Not a valid command [clean, build, install, make all]" ;;
esac
    
exit 0
