# Start Lab Server

```sh
npm install
```

Default PORT=3000

```sh
node .
```

Alternate port:

```sh
PORT=3001 node .
```


test:

```sh
curl http://localhost:3000/api -X PUT -d '{ "key": "value" }' -H "Content-Type: application/json"
```