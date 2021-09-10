url=http://127.0.0.1:3030/dispatch/configuration/m1.small

qemu-kvm \
  -enable-kvm \
  -m 16G \
  -cpu max \
  -serial mon:stdio \
  \
  -netdev tap,id=nd1,script="./boot/helper.sh" \
  -device virtio-net-pci,netdev=nd1 \
  \
  -msg timestamp=on \
  \
  -mon chardev=con0,mode=readline \
  -chardev socket,id=con0,path=./console.pipe,server,nowait \
  \
  -nographic
