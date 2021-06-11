# build kernel
cd /workspaces/appleos/kernel &&\
source buildenv.sh && \
clang++ $CPPFLAGS -O2 -Wall -g --target=x86_64-elf -ffreestanding -mno-red-zone -fno-exceptions -fno-rtti -std=c++17 -c main.cpp && \
ld.lld $LDFLAGS --entry KernelMain -z norelro --image-base 0x100000 --static -o kernel.elf main.o

# build
cd $HOME/edk2
ln -s /workspaces/appleos/AppleLoaderPkg ./
source edksetup.sh
cp /workspaces/appleos/target.txt $HOME/edk2/Conf/target.txt
build

# run qemu
cd /workspaces/appleos && \
$HOME/osbook/devenv/run_qemu.sh $HOME/edk2/Build/AppleLoaderX64/DEBUG_CLANG38/X64/Loader.efi /workspaces/appleos/kernel/kernel.elf

