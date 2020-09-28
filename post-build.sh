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
patch -d ${TARGET_DIR} -p0 < ${POST_DIR}/insmod.patch
patch -d ${TARGET_DIR} -p0 < ${POST_DIR}/libpath.patch
patch -d ${TARGET_DIR} -p0 < ${POST_DIR}/nfs.patch


chmod a+x ${TARGET_DIR}/etc/init.d/*


cp ${POST_DIR}/libglog.so.0.4.0 ${TARGET_DIR}/usr/lib
echo "patch ok"
