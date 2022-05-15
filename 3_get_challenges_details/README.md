# 3. Get Challenges Details

After getting all the challenges ids, we need to get the details from each challenge. For this we're going to get back to ZAP and leverage the `getChallengeDetails` websocket request the frontend is using.

## 3.1 Preparation & Dependency Insatallation

For executing this, you need elixir installed, after that, you can install the dependencies with:

```bash
mix deps.get
```

After this just copy your previous json results in the `assets` folder.

## 3.2 GetChallengesDetails module

Execute the module with

```bash
iex -S mix
```
