
# https://www.dragonflybsd.org/docs/docs/howtos/howtomovevmwaredisk/

set -e

#1. download ISO
if [ !-e "$VM_OS_NAME.iso" ]; then
  echo "Downloading $VM_ISO_LINK"
  wget -q -O $VM_OS_NAME.iso $VM_ISO_LINK
fi
ls -lah


#2. attach ISO
echo "Attaching $VM_OS_NAME.iso"
bash vbox.sh attachISO  $VM_OS_NAME   $VM_OS_NAME.iso


#3. startVM
echo "Start vm"
bash run.sh startVM


#4. login as root
echo "Wait for Default: F"
if bash vbox.sh waitForText $VM_OS_NAME "Default: F" 5 ; then
  echo "OK, enter"
  bash vbox.sh enter $VM_OS_NAME
fi


echo "Wait for Booting in"
if bash vbox.sh waitForText $VM_OS_NAME "Booting in" 5 ; then
  echo "OK, enter"
  bash vbox.sh enter $VM_OS_NAME
fi

echo "waitForLoginTag"
bash run.sh waitForLoginTag

echo "OK, root"
bash vbox.sh string $VM_OS_NAME root
bash vbox.sh enter $VM_OS_NAME


echo "OK, input hooks/seno.txt"
#5. input hooks/seno.txt
bash vbox.sh inputFile $VM_OS_NAME hooks/seno.txt

echo "Wait for Booting in"
#6. wait for reboot tag
bash vbox.sh waitForText $VM_OS_NAME "Booting in"


#7. stopVM
echo "shutdownVM"
bash vbox.sh shutdownVM $VM_OS_NAME


#8. detachISO
echo "shutdownVM"
bash vbox.sh detachISO $VM_OS_NAME


#9. done.
echo "done."





