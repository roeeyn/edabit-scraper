# 3. Get Challenges Details

After getting all the challenges ids, we need to get the details from each challenge. For this we're going to get back to ZAP and leverage the `getChallengeData` websocket request the frontend is using.

## 3.1 Preparation & Dependency Insatallation

For executing this, install python dependencies by

```bash
pip install -r requirements3.txt
```

After this just copy your previous json results in the `challenge_ids` folder.

## 3.2 Create the payload

To create the payload, execute:

```bash
python3 main.py --ids-path challenge_ids/sample_indexes_payload_result.txt.json --request-id 10
```
