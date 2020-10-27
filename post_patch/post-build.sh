#!/bin/bash 
echo "user patch root"

OPTIND=2
while getopts :p: opt ; do
	case $opt in
		p)
			POST_DIR=${OPTARG}
			echo "dir=${POST_DIR}"
			;;
		\?)
			echo "no POST_DIR ,error"
			;;
	esac
done

patch -d ${TARGET_DIR} -p0 < ${POST_DIR}/sshd.patch
patch -d ${TARGET_DIR} -p0 < ${POST_DIR}/interface.patch
patch -d ${TARGET_DIR} -p0 < ${POST_DIR}/libpath.patch
patch -d ${TARGET_DIR} -p0 < ${POST_DIR}/nfs.patch

#update.sh
cp ${POST_DIR}/update.sh ${TARGET_DIR}
chmod a+x ${TARGET_DIR}/update.sh

#udev && firmware.sh
#udev
cp ${POST_DIR}/50-udev-default.rules ${TARGET_DIR}/lib/udev/rules.d/50-udev-default.rules
#firmware.sh
cp ${POST_DIR}/firmware.sh ${TARGET_DIR}/lib/udev/firmware.sh
chmod a+x ${TARGET_DIR}/lib/udev/firmware.sh


chmod a+x ${TARGET_DIR}/etc/init.d/*


echo "patch ok"
