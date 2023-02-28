from pathlib import Path
import subprocess

scripts_dir = Path(__file__).parent / "scripts"

def run_script(name: str) -> str:
    result = subprocess.run(
        scripts_dir / f'{name}.sh',
        shell=False,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )
    return result.stdout.decode()
