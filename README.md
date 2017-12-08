# Camera2 API Enabler for Google Camera (Mi A1) 

One step for enable or disable camera2 API for Google Camera, still support OTA update, no root, bootloader locked

Windows only!

## Caution!

Any damage on your phone is your responsibility.  

## Feature

One step command to enable or disable camera2 API. This allow you to get OTA update and the phone is still unrooted and locked bootloader

## Prerequaites 
- This script requires unmodified file system! If you don't sure, please [flash the new one](http://en.miui.com/thread-807252-1-1.html)
- Download [TWRP recovery](https://forum.xda-developers.com/mi-a1/development/recovery-twrp-3-1-1-0-touch-recovery-t3688472) and copy it into this project, and rename it to `recovery.img`
- Install [android driver](https://forum.xda-developers.com/showthread.php?t=2588979)
- Enable USB debugging and allow OEM unlock on your phone
- Plug the phone to the computer 
- This script reqiures `bash` to run. I recommend to install [scoop](http://scoop.sh/), which is package manager, and install `gow` package in order to get `bash`

## What this script do with your phone?
1. Unlock bootloader
2. Add 2 lines into Build.prop

```
persist.camera.HAL3.enabled=1
persist.camera.eis.enable=1
``` 
3. Lock bootloader
4. reboot

## Usage

-  To enable camera2 API (After this script run, the phone cannot update)

```
bash gcam.sh
```

Note: When TWRP recovery is booted, please mount system partition. The script will be continue.

- If you want to get OTA update, please disable camera2 API

```
bash gcam-disabler.sh
```

# Resoures
- [Google Camera APK download](https://www.xda-developers.com/google-camera-hdr-customization-raw-support/)
- This script use recovery image from [XDA](https://forum.xda-developers.com/mi-a1/development/recovery-twrp-3-1-1-0-touch-recovery-t3688472)

# Alternative Script
- [https://github.com/neungnarakjung/android-enable-camera2-api](https://github.com/neungnarakjung/android-enable-camera2-api)

# LICENSE

GNU GENERAL PUBLIC LICENSE