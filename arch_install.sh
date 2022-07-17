# Connect to wifi
# iwctl
# > station list
# > station wlan0 get-networks
# > station wlan0 connect "Network Name"

# Partition disk
# fdisk -l
# > m
# > p
# > d
# > p
# > n
# > p
# > w

# Update System clock
# timedatectl set-ntp true

# Mount the filesystem
# mount /dev /nvme0n1p5 /mnt
# mount --mkdir /dev/nvme0n1p1 /mnt/boot


# Bootstrap base system
# pactstrap /mnt base linux linux-firmware

# Generate fstab
# genfstab -U /mnt >> /mnt/etc/fstab

# Chroot
# arch-chroot /mnt

echo "=== Setting Time Zone and locale..."
ln -sf /usr/share/zoneinfo/US/Central /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "=== Setting Hostname..."
echo "paul-p1" > /etc/hostname

# Set the password
# passwd

echo "=== Installing essential packages..."
pacman -S grub os-prober sudo networkmanager git openssh

# Install grub
echo "=== Installing grub..."
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -po 
