import subprocess


def manage_windows(switch: str) -> str:
    '''Virtual Windows management'''

    if switch == "on":
        result = subprocess.run(
            ["echo", "win11"],
            shell=False,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
        )

    if switch == "off":
        result = subprocess.run(
            ["sudo", "virsh", "destroy", "win11"],
            shell=False,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
        )

    return result.stdout.decode()
