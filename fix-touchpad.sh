#!/bin/bash

source /etc/default/grub

OLD_PARAMS="$GRUB_CMDLINE_LINUX_DEFAULT"
NEW_PARAMS="$GRUB_CMDLINE_LINUX_DEFAULT"

if ! [[ $OLD_PARAMS == *"i8042.nopnp="* ]]; then
	NEW_PARAMS="$NEW_PARAMS i8042.nopnp=1"
	echo "Adding param: i8042.nopnp=1"
fi

if ! [[ $OLD_PARAMS == *"pci="* ]]; then
	NEW_PARAMS="$NEW_PARAMS pci=nocrs"
	echo "Adding param: pci=nocrs"
fi

sed -i -E "s/GRUB_CMDLINE_LINUX_DEFAULT=\"$OLD_PARAMS\"/GRUB_CMDLINE_LINUX_DEFAULT=\"$NEW_PARAMS\"/" /etc/default/grub

source /etc/default/grub
# echo "Kernel params: $GRUB_CMDLINE_LINUX_DEFAULT"


