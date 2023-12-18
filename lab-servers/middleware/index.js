'use strict'

const PORT = process.env.PORT || 3000

const express = require('express')
const app = module.exports = express()

// For parsing application/json
app.use(express.json())

app.get('/api', (req, res) => {
  console.log(`${new Date().toString()} - ${req.method} - ${req.path}`)
  const status = {
    'Status': 'Running'
  }
  res.send(status)
})

app.put('/api', (req, res) => {
  console.log(`${new Date().toString()} - ${req.method} - ${req.path}`)
  res.send(req.body)
})

app.listen(PORT, () => {
  console.log("Server Listening on PORT:", PORT);
})
