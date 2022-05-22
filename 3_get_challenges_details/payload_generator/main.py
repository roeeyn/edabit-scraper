import typer
import json
from typing import Dict
from typing import List
from pathlib import Path
from io import TextIOWrapper
from typer import Typer
from string import Template

payload = """["{\\"msg\\":\\"method\\",\\"method\\":\\"getChallengeData\\",\\"params\\":[\\"$challenge_id\\"],\\"id\\":\\"$request_id\\"}"]
"""
payload_template: Template = Template(payload)

app: Typer = typer.Typer()


def write_payload(ids_path: Path, request_id: int) -> None:
    """Write the payload for fuzzing the getChallengeData WS message

    Creates this payload so it can be used later in ZAP to fuzz the
    message inside the corresponding WS.

    Args:
        ids_path: Path to the challenge ids json file
        request_id: Initial request from the WS to fuzz

    Returns:
        None: Return nothing as we're writing the payload to disk
    """
    with open(ids_path) as ids_file:
        challenges: List[Dict[str, str]] = json.load(ids_file)

    file: TextIOWrapper = open("edabit_ws_payload.txt", "w")

    for challenge in challenges:
        challenge_id: str = challenge["_id"]
        request_id += 1
        new_line: str = payload_template.substitute(
            challenge_id=challenge_id, request_id=request_id
        )
        file.write(new_line)

    file.close()


@app.command()
def create_payload(
    ids_path: Path = typer.Option(..., help="json file with challenge ids"),
    request_id: int = typer.Option(..., help="The initial request id, usually 6"),
):
    """
    Create the payload for the getChallengeDetails WS request
    """
    if not ids_path.is_file():
        error_message: str = typer.style(
            f"{ids_path} is not a file", fg=typer.colors.RED, bold=True
        )
        typer.echo(error_message)
        raise typer.Abort()

    description: str = typer.style(
        "Reading from file:", fg=typer.colors.WHITE, bold=True
    )
    showed_value: str = typer.style(ids_path, fg=typer.colors.GREEN, bold=True)
    typer.echo(f"{description} {showed_value}")

    write_payload(ids_path, request_id)

    success_message: str = typer.style(
        "Payload created successfully", fg=typer.colors.GREEN, bold=True
    )
    typer.echo(success_message)


if __name__ == "__main__":
    app()
