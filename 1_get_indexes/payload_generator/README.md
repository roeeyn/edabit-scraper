# Payload Generator for Edabit from ZAP

To create a sample of how you need to create the payload, you can run the following script, which will fetch the ZAP API for a sample message (the channel and message ID may vary):

```bash
curl http://localhost:8080/JSON/websocket/view/message/?apikey=YOUR_API_KEY&channelId=2&messageId=30 > v2/1_get_indexes/raw_results/sample_indexes_payload_result.txt
```

This will create a `sample_payload_result.txt` file, which will be our base for our script.

## 1. Created the Script

I started using a simple python script, but then I think this was a great opportunity to try out the [Typer](https://typer.tiangolo.com/) project for creating a nice CLI.

## 2. Ran the Script

To run the script, just execute:

```bash
# Substitute the values with your own.
python3 main.py --amount 10 --request-id 3 --payload-amount 20 --language javascript
```

This will generate a file named `edabit_ws_payload.txt`. I kept the name static, so I can quickly regenerate the file after some tests and the path would remain the same in my disk.
