'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '10.13.237.23';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
