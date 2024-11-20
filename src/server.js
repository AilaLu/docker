const express = require('express')
const app = express()

app.get('/', (req, res) => {
 res.send('It\'s running on a docker container!!!')
})

app.listen(3000, function() {
  console.log('app listening on port 3000');
  
})