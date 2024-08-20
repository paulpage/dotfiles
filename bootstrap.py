import os
import sys
import subprocess


def symlink(target, link_name):
    if os.path.islink(link_name):
        os.remove(link_name)
    os.symlink(target, link_name)


def fail(msg):
    print(f'ERROR: {msg}')
    sys.exit(1)

def run(cmd):
    subprocess.run(cmd)


def home_folder():
    folder = os.environ.get('HOME')
    if folder is None:
        fail('HOME environment variable is not set')
    return folder


def bootstrap_app(path):

    f = list(path.split("/"))
    d = f[:-1]

    src_folder = os.path.join(os.getcwd(), *d)
    dst_folder = os.path.join(home_folder(), *d)
    src_file = os.path.join(os.getcwd(), *f)
    dst_file = os.path.join(home_folder(), *f)

    if not os.path.exists(src_file):
        print(f'{src_file} does not exist. Create it?')
        answer = input('y/N: ')
        if len(answer) > 0 and answer.lower()[0] == 'y':
            os.makedirs(src_folder)
            print(f'Created empty {src_folder}')
            with open(src_file, 'w') as f:
                f.write('')
            print(f'Created empty {src_file}') 
        else:
            sys.exit(0)

    os.makedirs(dst_folder, exist_ok=True)
    symlink(src_file, dst_file)
    print(f'Symlinked {src_file} to {dst_file}')


def install_arch_packages(filename):
    with open(filename, "r") as f:
        lines = f.readlines()
    packages = [l.strip() for l in lines]
    run(["sudo", "pacman", "-S", *packages])


app_entries = {
    "emacs": ".config/emacs/init.el",
    "foot": ".config/foot/foot.ini",
    "git": ".config/git/config",
}
package_entries = {
    "arch-common": "arch_packages_common.txt",
    "arch-wayland": "arch_packages_wayland.txt",
    "arch-i3": "arch_packages_i3.txt",
}


if len(sys.argv) != 2:
    print(f"Usage: {sys.argv[0]} <app>")
    print("\nApps:")
    for e in app_entries.keys():
        print(f"- {e}")
    print("\nPackages:")
    for e in package_entries.keys():
        print(f"- {e}")

    sys.exit(1)

choice = sys.argv[1]
if choice in app_entries:
    bootstrap_app(app_entries[choice])
elif choice in package_entries:
    if choice.startswith("arch"):
        install_arch_packages(package_entries[choice])
