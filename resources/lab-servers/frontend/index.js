'use strict'

const PORT = process.env.PORT || 3000
const UPSTREAM_API_ADDR = process.env.UPSTREAM_API_ADDR || 'localhost'
const UPSTREAM_API_PORT = process.env.UPSTREAM_API_PORT || 3000
const UPSRTEAM_API = `${UPSTREAM_API_ADDR}:${UPSTREAM_API_PORT}`

const express = require('express')
const app = module.exports = express()

// For parsing application/json
app.use(express.json())
// For serving static content
app.use(express.static('public'))

app.get('/api', (req, resp) => {
  console.log(`${new Date().toString()} - ${req.method} - ${req.path}`)
  fetchData(req.path)
  .then(api_resp => {
    console.log(`Message Router: /api: ${JSON.stringify(api_resp)}`)
    resp.send(api_resp)
  })
})

// example: http://localhost:3000/api/users/
app.get('/api/users', (req, resp) => {
  console.log(`${new Date().toString()} - ${req.method} - ${req.path}`)
  fetchData(req.path)
  .then(api_resp => {
    console.log(`Message Router: /api/users: ${JSON.stringify(api_resp)}`)
    resp.send(api_resp)
  })
})

// example: http://localhost:3000/api/user/tobi/repos/
app.get('/api/user/:name/repos', (req, resp) => {
  console.log(`${new Date().toString()} - ${req.method} - ${req.path}`)
  fetchData(req.path)
  .then(api_resp => {
    console.log(`Message Router: /api/user/:name/repos: ${JSON.stringify(api_resp)}`)
    resp.send(api_resp)
  })
})


async function fetchData(path) {
  try {
    const response = await fetch('http://'+UPSRTEAM_API+path);
    console.log(`response codes: ${response.status}`)
    if (!response.ok) {
      return JSON.parse(`{"Status": "Error response from API", "code": "${response.status}"}`)
    }
    else {
      const data = await response.json()
      console.log(data)
      return data
    }
  } catch (error) {
    console.error('Error fetching data:', error)
    return JSON.parse(`{"Status": "Error reaching API", "Message": "Something went really wrong. Blame the network!"}`)
  }
}

app.listen(PORT, () => {
  console.log("Server Listening on PORT:", PORT);
  console.log("Upstream API Server:", UPSRTEAM_API);
})
