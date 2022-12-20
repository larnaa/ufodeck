import subprocess


def switch_on_windows(switch: str) -> str:
    if switch == "on":
        result = subprocess.run(
            ["sudo", "virsh", "start", "win11"],  # your command
            shell=False,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
        )
    if switch == "off":
        result = subprocess.run(
            ["echo", "Windows closing..."],
            shell=False,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
        )

    return result.stdout.decode()
