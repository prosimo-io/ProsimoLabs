'use strict'

const PORT = process.env.PORT || 3000
const UPSTREAM_API_ADDR = process.env.UPSTREAM_API_ADDR || 'localhost'
const UPSTREAM_API_PORT = process.env.UPSTREAM_API_PORT || 3000
const UPSRTEAM_API = `${UPSTREAM_API_ADDR}:${UPSTREAM_API_PORT}`

const http = require('http')
const express = require('express')
const app = module.exports = express()

// For parsing application/json
app.use(express.json())

app.get('/', (req, resp) => {
  console.log(`${new Date().toString()} - ${req.method} - ${req.path}`)
  resp.send('Front End: Hello World')
})

app.get('/api', (req, resp) => {
  console.log(`${new Date().toString()} - ${req.method} - ${req.path}`)
  fetchData(req.path)
  .then(api_resp => {
    console.log(`api_resp: ${JSON.stringify(api_resp)}`)
    resp.send(api_resp)
  })
})

async function fetchData(path) {
  try {
      const response = await fetch('http://'+UPSRTEAM_API+path);
      const data = await response.json();
      console.log(data);
      return data
  } catch (error) {
      console.error('Error fetching data:', error);
  }
}

app.listen(PORT, () => {
  console.log("Server Listening on PORT:", PORT);
  console.log("Upstream API Server:", UPSRTEAM_API);
})
