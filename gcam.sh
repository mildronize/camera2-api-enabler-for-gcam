# path  
# /system/build.prop
# /system/system/build.prop
bash unlock-bootloader.sh

# Waiting for adb shell ready!
wait_for_mounting_system() {
    while true; do
        local result=`adb shell "mount | grep /system | wc -l"` || true
        if [ $result -eq 1 ] ; then
            break
        else
            echo "Waiting for mounting_system"
        fi
        sleep 1 
    done
}

# Waiting for fastboot ready!
wait_for_fastboot() {
    while true; do
        local fastboot_result=`fastboot devices | wc -l`
        if [ $fastboot_result -eq 1 ] ; then
            break
        else
            echo "Waiting for fastboot mode"
        fi
        sleep 1 
    done
}

wait_for_fastboot

#boot twrp temporality
fastboot boot recovery.img

# waiting for user mount /system and checking if adb shell available
wait_for_mounting_system

echo "System partition is mounted"
# check existing build.prop in /system/build.prop,  /system/system/build.prop
# back up!
adb shell "cp /system/system/build.prop /system/system/build.prop.backup"
adb shell "echo -e '#modified build.prop for gcam\npersist.camera.HAL3.enabled=1\npersist.camera.eis.enable=1' >> /system/system/build.prop"

adb reboot bootloader
wait_for_fastboot
fastboot oem lock

fastboot reboot