# 1. Get the IDs from the available challenges by language

## 1.1 Verify websocket logic in webpage

I saw that everything was fetched via websocket, so I tried to create a heap snapshot (Memory -> Heap snapshot), and then expose the socket as a global variable in the console.

The main logic for not getting a "Bad framing error" was just to increment 10 by 10 the requested challenges, and increment by 1 the id of the request. e.g. 30, 1 -> 40, 2 -> 50, 3

This worked well, which give me the entry point of how to get the challenges, but wasn't able to automate it as the socket creation flow is behind some meteor auth process which I don't understand, and didn't want to go through that approach.

## 1.2 Proxy the websocket

I tried using burp to proxy the websocket, but it doesn't come with great support for this, so I changed to ZAP. This last tool gave me the ability to fuzzy messages into the proxied websocket, which gave me ability to fetch all the messages on demand, based on the payloads I was generating (see payload generator).

## 1.3 Result Notes:

- JS 2430 exercises, approx. 1,416,604 bytes in last message
- Python3 2510 exercises, approx. 1,456,333 bytes in last message
- Java 860 exercises, approx. 490,548 bytes in last message
