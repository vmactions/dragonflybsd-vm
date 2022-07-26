
# https://www.dragonflybsd.org/docs/docs/howtos/howtomovevmwaredisk/

set -e

#1. download ISO
echo "Downloading $VM_ISO_LINK"
wget -q -O $VM_OS_NAME.iso $VM_ISO_LINK


#2. attach ISO

bash vbox.sh attachISO  $VM_OS_NAME   $VM_OS_NAME.iso


#3. startVM

bash run.sh startVM


#4. login as root
bash vbox.sh waitForText $VM_OS_NAME "Booting in"
bash vbox.sh enter $VM_OS_NAME


bash run.sh waitForLoginTag
bash vbox.sh string $VM_OS_NAME root
bash vbox.sh enter $VM_OS_NAME



#5. input hooks/seno.txt
bash vbox.sh inputFile $VM_OS_NAME hooks/seno.txt


#6. wait for reboot tag
bash vbox.sh waitForText $VM_OS_NAME "Booting in"


#7. stopVM

bash vbox.sh shutdownVM $VM_OS_NAME


#8. detachISO
bash vbox.sh detachISO $VM_OS_NAME


#9. done.






