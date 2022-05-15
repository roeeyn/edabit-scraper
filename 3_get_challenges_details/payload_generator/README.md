# Payload Generator for Edabit Challenge Details from Previous Results

We're going to use the previous results (saved in `challenge_ids`) and from there we're going to generate payloads for the websocket fuzzing in ZAP

## 1. Created the Script

I liked how the last payload generator script went, so I'm sticking to the typer framework to create this new CLI.

You can install it with

```bash
pip install -r requirements3.txt
```

## 2. Ran the Script

To run the script, just execute:

```bash
# Substitute the values with your own.
python3 main.py --amount 10 --request-id 3 --payload-amount 20 --language javascript
```

This will generate a file named `edabit_ws_payload.txt`. I kept the name static, so I can quickly regenerate the file after some tests and the path would remain the same in my disk.
