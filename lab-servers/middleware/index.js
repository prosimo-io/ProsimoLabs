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


app.get('/api/users', (req, res) => {
  res.send(users);
});

app.get('/api/repos', (req, res) => {
  res.send(users);
});

// example: http://localhost:3000/api/user/tobi/repos/
app.get('/api/user/:name/repos', (req, res, next) => {
  const name = req.params.name
  const user = userRepos[name]
  if (user) res.send(user)
  else next()
})

app.listen(PORT, () => {
  console.log("Server Listening on PORT:", PORT);
})


// these three objects will serve as our faux database

const repos = [
  { name: 'express', url: 'https://github.com/expressjs/express' },
  { name: 'stylus', url: 'https://github.com/learnboost/stylus' },
  { name: 'cluster', url: 'https://github.com/learnboost/cluster' }
]

const users = [
  { name: 'tobi' }
  , { name: 'loki' }
  , { name: 'jane' }
]

const userRepos = {
  tobi: [repos[0], repos[1]]
  , loki: [repos[1]]
  , jane: [repos[2]]
}
