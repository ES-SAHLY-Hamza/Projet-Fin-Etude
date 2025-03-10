const express = require('express');
const routes = require('./routes/user')
require('./config/database');

const app = express();

app.use(express.json())
app.use('/users',routes)

app.listen(3000, '0.0.0.0', () => {
    console.log('Server running on port 4000');
    console.log('Ready for messages');
  });