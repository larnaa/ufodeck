#@larnaa@192.168.0.0.1

import subprocess

def switch_on_windows():
    result = subprocess.run(['echo', 'Windows loading...'],
                        shell=False,
                        stdout=subprocess.PIPE,
                        stderr=subprocess.PIPE,
                        check=False)

    return result.stdout.decode()
