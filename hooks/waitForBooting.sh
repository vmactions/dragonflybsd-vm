


echo "====> Wait for Default: F"
if bash vbox.sh waitForText $VM_OS_NAME "Default: F" 5 ; then
  echo "====> OK, enter"
  bash vbox.sh enter
fi


echo "====> Wait for Booting in"
if bash vbox.sh waitForText $VM_OS_NAME "Booting in" 7 ; then
  echo "====> OK, enter"
  bash vbox.sh enter
fi


