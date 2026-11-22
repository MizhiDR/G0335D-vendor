#!/system/bin/sh
# Asynchronous wlan.ko bring-up. Runs as an init oneshot service, NOT in
# init's main loop, so the ~121s QCA module_init no longer blocks boot.
MOD=/vendor/lib/modules/wlan.ko
FW=/sys/module/wlan/parameters/fwpath

# finit_module() returns only after the driver's module_init completes.
/system/bin/insmod "$MOD"
rc=$?
/system/bin/setprop wlan.async.insmod_rc "$rc"

# fwpath appears once the module is fully initialized. Poll as a safety net.
i=0
while [ ! -e "$FW" ] && [ "$i" -lt 200 ]; do
    /system/bin/sleep 1
    i=$((i+1))
done

if [ -e "$FW" ]; then
    /system/bin/chown wifi wifi "$FW"
    /system/bin/chmod 0664 "$FW"
    /system/bin/setprop wlan.driver.status ok
    /system/bin/setprop wlan.async.ready 1
else
    /system/bin/setprop wlan.driver.status timeout
    /system/bin/setprop wlan.async.ready 0
fi
