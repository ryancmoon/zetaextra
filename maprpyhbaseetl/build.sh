#!/bin/bash

checkdocker
check4dockerimage "${APP_IMG_NAME}" BUILD
reqdockerimg "${REQ_APP_IMG_NAME}"

if [ "$BUILD" == "Y" ]; then
    rm -rf $BUILD_TMP
    mkdir -p $BUILD_TMP
    cd $BUILD_TMP

    if [ ! -d "/opt/mapr/lib" ]; then
        @go.log FATAL "Could not find /opt/mapr/lib - Need this to build"
    fi
    # Since BUILD is now "Y" The vers file actually makes the dockerfile
    . ${MYDIR}/${APP_PKG_BASE}/${APP_VERS_FILE}
    cd $MYDIR
    rm -rf $BUILD_TMP
    echo ""
    @go.log INFO "$APP_NAME package build with $APP_VERS_FILE"
    echo ""
else
    @go.log WARN "Not rebuilding $APP_NAME"
fi


