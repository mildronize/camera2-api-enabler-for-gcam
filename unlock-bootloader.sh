
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

echo "Please enable USB debugging and allow to unlock oem. This program try to connect your device."
adb wait-for-device
# echo $? # exit 0 when connected
echo "The device is ready"

adb reboot bootloader

wait_for_fastboot

fastboot oem unlock