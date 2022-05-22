import typer
from io import TextIOWrapper
from typer import Typer
from string import Template

payload = """["{\\"msg\\":\\"method\\",\\"method\\":\\"getChallenges\\",\\"params\\":[\\"$language\\",{\\"$$gte\\":0,\\"$$lt\\":6},[\\"algebra\\",\\"algorithms\\",\\"arrays\\",\\"bit_operations\\",\\"bugs\\",\\"closures\\",\\"conditions\\",\\"control_flow\\",\\"cryptography\\",\\"data_structures\\",\\"dates\\",\\"formatting\\",\\"functional_programming\\",\\"games\\",\\"geometry\\",\\"higher_order_functions\\",\\"interview\\",\\"language_fundamentals\\",\\"logic\\",\\"loops\\",\\"math\\",\\"numbers\\",\\"objects\\",\\"physics\\",\\"recursion\\",\\"regex\\",\\"scope\\",\\"sorting\\",\\"strings\\",\\"validation\\"],$amount,[]],\\"id\\":\\"$request_id\\"}"]
"""
payload_template: Template = Template(payload)

app: Typer = typer.Typer()


def write_payload(
    amount: int, request_id: int, payload_amount: int, language: str
) -> None:
    """Create the generated payload to edabit_ws_payload.txt

    This is the payload to input in ZAP for fuzzing the WS

    Args:
        amount: Initial challenges amount, usually 10
        request_id: Initial request id, usually 2
        payload_amount: The amount of payloads you want to generate
        language: The programming language you're targeting. e.g. javascript

    Returns:
        None: Returning nothing as it is written to disk directly.
    """
    file: TextIOWrapper = open("edabit_ws_payload.txt", "w")
    for _ in range(payload_amount + 1):
        amount += 10
        request_id += 1
        new_line: str = payload_template.substitute(
            language=language, amount=amount, request_id=request_id
        )
        file.write(new_line)

    file.close()


@app.command()
def create_payload(
    amount: int = typer.Option(..., help="Initial challenges amount. Usually 10"),
    request_id: int = typer.Option(..., help="Initial request id. Usually 2"),
    payload_amount: int = typer.Option(
        ..., help="The amount of payloads you want to generate"
    ),
    language: str = typer.Option(
        ..., help="The programming language you're targeting. e.g. javascript"
    ),
):
    """
    Create the payload list to send for the ZAP WS fuzzer
    """
    before_start_messages = [
        ("Challenges initial amount:", amount),
        ("Initial request_id:", request_id),
        ("Amount of payloads to generate:", payload_amount),
        ("Target programming language:", language),
    ]

    for initial_message, input_value in before_start_messages:
        description: str = typer.style(
            initial_message, fg=typer.colors.WHITE, bold=True
        )
        showed_value: str = typer.style(
            str(input_value), fg=typer.colors.GREEN, bold=True
        )
        typer.echo(f"{description} {showed_value}")

    write_payload(
        amount=amount,
        request_id=request_id,
        payload_amount=payload_amount,
        language=language,
    )


if __name__ == "__main__":
    app()
