'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '10.13.237.25';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Auriane la star');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
