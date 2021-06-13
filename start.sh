# build
make

# run qemu
cd /workspaces/appleos && \
$HOME/osbook/devenv/run_qemu.sh $HOME/edk2/Build/AppleLoaderX64/DEBUG_CLANG38/X64/Loader.efi /workspaces/appleos/kernel/kernel.elf

