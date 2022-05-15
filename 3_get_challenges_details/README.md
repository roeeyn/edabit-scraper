# 3. Get Challenges Details

After getting all the challenges ids, we need to get the details from each challenge. For this we're going to get back to ZAP and leverage the `getChallengeData` websocket request the frontend is using.

## 3.1 Preparation & Dependency Insatallation

For executing this, install python dependencies by

```bash
pip install -r requirements3.txt
```

After this just copy your previous json results in the `payload_generator/challenge_ids` folder.

## 3.2 Create the payload

To create the payload, execute inside the `payload_generator`:

```bash
python3 main.py --ids-path challenge_ids/sample_indexes_payload_result.txt.json --request-id 10
```

This will generate the messages, inside ZAP, and now we need to extract them from there.

## 3.3 Get the messages from ZAP API

If we try to get the messages with:

```bash
curl http://localhost:8080/JSON/websocket/view/messages/\?apikey\=YOUR_API_KEY\&channelId\=2 > preview_parser/raw_results_previews/sample_data_payload_result_preview.txt
```

We're going to get all the messages from the channel selected, but as the payload is big, we're only going to get the previews. This is why we need to leverage one of the first endpoints from ZAP that we used that is `/message`.
I created a script that get all the message ids from the responses, so we can then get all the complete details from those messages.

To get all this message details execute:

```bash
```
