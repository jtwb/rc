
VMIMAGE="Ubuntu\ 64-bit"
VMUSER=j
VMIP="172.16.71.128"

alias vmup="a; vmrun -T fusion start $HOME/Documents/Virtual\ Machines.localized/$VMIMAGE.vmwarevm/$VMIMAGE.vmx nogui"

alias vmp="a; vmrun -T fusion pause $HOME/Documents/Virtual\ Machines.localized/$VMIMAGE.vmwarevm/$VMIMAGE.vmx"

alias vusu="ssh -A -l $VMUSER $VMIP"
