import typer
import json
from typing import cast
from typing import Dict
from typing import List
from pathlib import Path
from typer import Typer
import requests
from requests import Response

app: Typer = typer.Typer()


def get_details_from_zap(url: str) -> Dict[str, str]:
    """
    Get the details from the zap api.
    """
    response: Response = requests.get(url)
    return response.json()


def parse_file(file_path: Path) -> None:
    """
    Parse the raw file and write the result to a temp txt files.
    """
    with open(file_path, "r") as f:
        decoded_raw_file: Dict[str, str] = json.load(f)

    messages: List[Dict[str, str]] = cast(
        List[Dict[str, str]], decoded_raw_file.get("messages", [])
    )

    temp_file_path = open("message_ids.txt", "w")

    for message in messages:
        payload_fragment: str = message.get("payloadFragment", "")
        if "result" in payload_fragment and "_id" in payload_fragment:
            temp_file_path.write(f"{message['id']}\n")

    temp_file_path.close()


@app.command()
def get_message_details(
    api_key: str = typer.Option(..., help="The ZAP API key to use"),
    channel_id: int = typer.Option(..., help="Channel id of the websocket"),
) -> None:
    """
    Parse message ids and get the details of the messages.
    """
    base_url = "http://localhost:8080/JSON/websocket/view/message/"
    url = base_url + "?apikey={api_key}&channelId={channel_id}&messageId={message_id}"
    with open("message_ids.txt", "r") as f:
        message_ids: List[str] = f.readlines()

    detail_list: List[Dict[str, str]] = []
    for message_id in message_ids:
        message_id = message_id.strip()
        formatted_url: str = url.format(
            api_key=api_key, channel_id=channel_id, message_id=message_id
        )
        details: Dict[str, str] = get_details_from_zap(formatted_url)
        detail_list.append(details)

    for detail in detail_list:
        raw_payload = detail.get("payload", "")
        raw_result_file: str = f'message_{detail.get("id", "")}.txt'
        with open(f"../raw_results/{raw_result_file}", "w") as f:
            f.write(raw_payload)


@app.command()
def parse_raw_preview_file(
    previews_path: Path = typer.Option(..., help="file with raw responses from ZAP"),
):
    """
    Parses raw preview file from ZAP
    """
    if not previews_path.is_file():
        error_message: str = typer.style(
            f"{previews_path} is not a file", fg=typer.colors.RED, bold=True
        )
        typer.echo(error_message)
        raise typer.Abort()

    description: str = typer.style(
        "Reading from file:", fg=typer.colors.WHITE, bold=True
    )
    showed_value: str = typer.style(previews_path, fg=typer.colors.GREEN, bold=True)
    typer.echo(f"{description} {showed_value}")

    parse_file(previews_path)

    success_message: str = typer.style(
        "Payload created successfully", fg=typer.colors.GREEN, bold=True
    )
    typer.echo(success_message)


if __name__ == "__main__":
    app()
