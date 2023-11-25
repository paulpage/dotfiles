import os
import sys
import sys


def symlink(target, link_name):
    if os.path.islink(link_name):
        os.remove(link_name)
    os.symlink(target, link_name)


def fail(msg):
    print(f'ERROR: {msg}')
    sys.exit(1)


def config_folder():
    folder = os.environ.get('XDG_CONFIG_HOME')
    if folder is None:
        fail('XDG_CONFIG_HOME environment variable is not set')
    return folder


def bootstrap_app(folder, filename):
    src_folder = os.path.join(os.getcwd(), '.config', folder)
    src_file = os.path.join(src_folder, filename)
    dest_folder = os.path.join(config_folder(), folder)
    dest_file = os.path.join(dest_folder, filename)

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

    os.makedirs(dest_folder, exist_ok=True)
    symlink(src_file, dest_file)
    print(f'Symlinked {src_file} to {dest_file}')


# bootstrap_app('i3', 'config')
if len(sys.argv) != 3:
    print(f'Usage: {sys.argv[0]} <folder> <file>')
    sys.exit(1)

bootstrap_app(sys.argv[1], sys.argv[2])
