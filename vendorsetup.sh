#
# Copyright (C) 2022 The OrangeFox Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

FDEVICE="CK9n"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export LC_ALL="C"
	export OF_DEFAULT_KEYMASTER_VERSION=4.1
	export OF_ENABLE_LPTOOLS=1
	export OF_FLASHLIGHT_ENABLE=0
	export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
	export OF_LOOP_DEVICE_ERRORS_TO_LOG=1
	export OF_NO_ADDITIONAL_MIUI_PROPS_CHECK=1
	export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
	export OF_QUICK_BACKUP_LIST="/boot;/data;"
	export OF_RUN_POST_FORMAT_PROCESS=1
	export OF_SUPPORT_VBMETA_AVB2_PATCHING=1
	export OF_UNBIND_SDCARD_F2FS=1
	export OF_USE_GREEN_LED=0
	export OF_WIPE_METADATA_AFTER_DATAFORMAT=1
	export FOX_AB_DEVICE=1
	export FOX_ASH_IS_BASH=1
	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1616300800"; # Sun 21 Mar 04:26:40 GMT 2021
	export FOX_DELETE_AROMAFM=1
	export FOX_ENABLE_APP_MANAGER=0
	export FOX_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"
	export FOX_USE_BASH_SHELL=1
	export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_VIRTUAL_AB_DEVICE=1
   	export TW_DEFAULT_LANGUAGE="en"

	export OF_SCREEN_H=2400
	export OF_STATUS_H=100
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
  	export OF_HIDE_NOTCH=1
	export OF_CLOCK_POS=1

	export FOX_VERSION="R12.1_0"
	export FOX_VARIANT="A13+"
	export OF_MAINTAINER="DennisMurimi"

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
